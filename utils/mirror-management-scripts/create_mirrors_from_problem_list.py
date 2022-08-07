#!/usr/bin/env python3
"""Reads in a json file that lists "unmirrored sources", and tries to create
appropriate download mirrors.

IMPORTANT: Authentication:
    To create a git repository as a download mirror, you'll need at least
    maintainer access to the freedesktop-sdk/mirrors group. And to authenticate,
    you'll need to generate an access token "with API permissions", from Gitlab.

    To add a file to the tarball-lfs-mirror repository (as a download
    mirror for a tarball or zip archive), you'll need to have rights to push
    to that repository. If the script downloads a new copy of the
    tarball-lfs-mirror repository, you'll need an access token from Gitlab for
    this as well. (If you tell the script to use a copy of the repository that
    already exists on your machine, then it will assume you've already set up
    authentication credentials in the repository, and use those.

Background:
    The freedesktop-sdk project builds a lot of software which is downloaded
    from external source URLs, rather than included as part of the actual
    project repository. Buildstream allows the users to define download mirrors
    for these source URLs, by using aliases where the URLs are defined.

    The project has a goal to maintain our own download mirrors for most
    sources. These download mirrors are all hosted on a gitlab instance.
    (At time of writing, this is Gitlab.com. It that changes, then the constants
    defined at the top of this script will need to be changed.)

This script consumes the output of another script called "check_mirrors.py",
which generates a list of the sources that aren't currently mirrored. This
script reads that list as an input, and then tries to create appropriate
download mirrors.

Git repositories:
    If the source is a git repository, then the download mirror will be another
    git repository, hosted on a gitlab instance.

    We take advantage of the "groups" functionality on gitlab. We have a
    top_level group (At time of writing, this is
    https://gitlab.com/freedesktop-sdk/mirrors). Then we use subgroups (and
    sub-sub groups) to create repositories that have the appropriate URL.

Git repo example:
        A raw URL, defined in a .bst file:
            foo:bar/baz.git
        has the alias "foo:"
        and resolves to an "original source" URL:
            https://foohub.com/bar/baz.git
        and resolves to a download mirror url:
            https://gitlab.com/freedesktop-sdk/mirrors/foo/bar/baz.git

    (Note that "bar/baz.git" (the part following the colon in the raw URL), is
    repeated in the source url and the mirror URL. Only the first part changes.)

    To create a project with the appropriate mirror URL, we need to make a
    project called "baz", and place it in the "bar" group, which must be in the
    "foo" group, which must then be in the top level "mirrors" group.

    (Strictly speaking, 'mirrors' is a also a subgroup, of the freedesktop-sdk
    group. But for the purposes of this script, we refer to 'mirrors' as the
    'top' group.)

Tarballs, zip archives, and other files:
    If the source is a single downloadable file (a tarball, a zip archive, etc),
    then we provide a download mirror by storing a copy of the file in an lfs
    git repository. (At time of writing, this is
    https://gitlab.com/freedesktop-sdk/mirrors/tarball-lfs-mirror).

    To create the file, we need access to a local copy of that repository. The
    script then downloads the relevant file from the original source url, adds
    it to the local repository, creates a commit, and pushes the new commit to
    the remote repository.

    If you don't have an already-existing local copy, then the script can clone
    a new one. However, this can take a significant amount of time, so any
    maintainer who uses this script regularly should consider maintaining a
    persistent local copy of tarball-lfs-mirror.git.

Tarball example:
        A raw URL, defined in a .bst file:
            foo:bar/baz.tar.gz
        has the alias "foo:"
        and resolves to an "original source" URL:
            https://foohub.com/bar/baz.tar.gz
        and resolves to a download mirror url:
            https://gitlab.com/freedesktop-sdk/mirrors/tarball-lfs-mirror
            /raw/master/foo/bar/baz.tar.gz

    To create the download mirror, we download baz.tar.gz and put it in the
    folder "/foo/bar" in the repository. (Then we run git add, git commit, and
    at the end, git push.)
"""

import argparse
import json
import os
import subprocess
import tempfile
import sys
import gitlab

DEFAULT_PROBLEM_FILE = 'unmirrored_sources_list.json'
HELPTEXT_ACCESS_TOKEN_FILE = '~/.GitLab_access_token'
DEFAULT_ACCESS_TOKEN_FILE = os.path.expanduser(HELPTEXT_ACCESS_TOKEN_FILE)

GITLAB_URL = 'https://gitlab.com'
TOP_GROUP_ID = '3487254'
GIT_URL_START = 'https://gitlab.com/freedesktop-sdk/mirrors/'
TAR_URL_START = 'https://gitlab.com/freedesktop-sdk/mirrors/tarball-lfs-mirror/raw/master/'
TAR_REPO_URL = 'https://gitlab-ci-token@gitlab.com/freedesktop-sdk/mirrors/tarball-lfs-mirror.git'
TAR_REPO_NAME = 'tarball-lfs-mirror'
ACCESS_TOKEN_URL = 'https://gitlab.com/profile/personal_access_tokens'
REPO_DIR_HELP = (
    "The path to a local directory where the script can find (or create) a copy of the"
    + " tarball-lfs-mirror repository (the repository that stores one-file sources). Defaults to"
    + " the current working directory. If the path leads to a directory called 'tarball-lfs-mirror'"
    + ", or to directory containing a subdirectory called 'tarball-lfs-mirror', then the script"
    + " will assume that a copy of the repository already exists in the appropriate folder, and"
    + " attempt to use it. Otherwise, the script will clone a new copy of the mirror repository"
    + " inside the specified directory."
)
ACCESS_TOKEN_FILE_HELP = (
    "The path to a file containing a valid Gitlab access token which has API permissions."
    + " Defaults to '" + HELPTEXT_ACCESS_TOKEN_FILE + "'."
    + " The file should contain nothing except the access token, with no whitespace or newlines."
    + " (For security reasons, make sure no one else has read-access to this file)."
)
ACCESS_TOKEN_HELP = (
    "Background: In order to create new mirrors, the script needs a valid Gitlab API access"
    + " token so it can authenticate with the Gitlab instance.\n"
    + "API access tokens can be generated at " + ACCESS_TOKEN_URL + ".\n"
    + "(Make sure the token is in date (they expire), and that you have permissions"
    + " to edit the mirror repos.)"
)
AUTOMATION_HELP = (
    "Do not prompt before creating mirrors. Script will proceed with no user intervention, up to "
    + " and including creating new repositories and pushing new commits to tarball-lfs-mirror if"
    + " it can."
)
REPO_NOT_CREATED_TEXT = (
    "The tarball-lfs-mirror repository either couldn't be created, or local-master couldn't be"
    + " brought up to date with remote master. (If the local master is behind origin, the script"
    + " can ff-merge to bring local up to date. But if local is ahead of origin, or has diverged,"
    + " then the script will fail.)"
)
PROBLEM_FILE_HELP = (
        "the path to the json file listing unmirrored sources. Defaults to "
        + DEFAULT_PROBLEM_FILE + "."
    )


def PROCEED():
    return input("Proceed (Y/n)? ")[:1] in ['Y', 'y', '']


def get_arg_parser():
    """Prepare the arg_parser object."""
    arg_parser = argparse.ArgumentParser()
    arg_parser.add_argument(
        "-a", "--automatic", action='store_false', dest='require_prompt',
        help=AUTOMATION_HELP,
    )
    arg_parser.add_argument(
        "-p", "--problem_file", default=DEFAULT_PROBLEM_FILE,
        help=PROBLEM_FILE_HELP,
        metavar="UNMIRRORED_LIST.json"
    )
    arg_parser.add_argument(
        "-r", "--repo_parent_dir", default="./", dest='tar_repo_parent_dir',
        help=REPO_DIR_HELP,
        )
    arg_parser.add_argument(
        "-t", "--token_file", default=DEFAULT_ACCESS_TOKEN_FILE,
        dest='access_token_file', help=(ACCESS_TOKEN_FILE_HELP + '\n' + ACCESS_TOKEN_HELP),
        metavar="ACCESS_TOKEN_FILE"
    )
    return arg_parser

def main():
    """Iterates through the mirror_problems json file, calling relevant other
    methods as needed, to create the appropriate git mirror projects, or add
    the appropriate files to the tarball/zipfile mirror"""
    arg_parser = get_arg_parser()
    args = arg_parser.parse_args()
    create_mirrors_list = read_problems_file(args.problem_file)

    glb = None
    top_group = None
    gitlab_instance_initialized = False
    # tracks whether 'initialize_gitlab_instance' has been called, so that we only
    # call it once, and only if needed. Once called, the variable glb will be assigned
    # a gitlab object, (as defined in the python-gitlab library), and the variable
    # top_group will be assigned a gitlab 'group' object representing the
    # 'freedesktop-sdk/mirrors' group.
    tar_repo_dir = get_repo_path(args.tar_repo_parent_dir)
    tar_repo_initialized = False
    # tracks whether 'initialize_tar_repo()' has been called, so that we only
    # call it once, and only if needed. ("initialized" means that the tar file
    # repo has been found on the local machine (or cloned onto the local machine),
    # and brought up to date with origin, and master branch has been checked out.)

    access_token = get_access_token(args.access_token_file)

    for mirror_dict in create_mirrors_list:
        print("\n\n===============================================================")
        new_mirror_url = get_mirror_url_and_proceed(mirror_dict, args.require_prompt)
        #if new_mirror_url comes back as 'None', skip to next entry
        if new_mirror_url:
            print("------------------------")
            source_kind = mirror_dict['kind']

            if source_kind in ["git", "git_tag", "git_module"]:
                if not gitlab_instance_initialized:
                    glb, top_group = initialize_gitlab_instance(access_token)
                    gitlab_instance_initialized = True
                create_git_mirror(glb, mirror_dict['source_url'], top_group, new_mirror_url)

            elif source_kind in ["tar", "zip", "remote", "cargo", "pypi"]:
                if not tar_repo_initialized:
                    initialize_tar_repo(
                        tar_repo_dir, access_token, prompt_needed=args.require_prompt,
                    )
                    tar_repo_initialized = True
                create_file_mirror(mirror_dict['source_url'], tar_repo_dir, new_mirror_url)

            else:
                print(f"{source_kind} mirrors not implemented yet, cancelling")
    print("===============================================================")
    if tar_repo_initialized:
        push_tar_repo(tar_repo_dir, access_token, prompt_needed=args.require_prompt)

def push_tar_repo(tar_repo_dir, access_token, prompt_needed=True):
    '''Confirms that there are new commits to be pushed, in the
    tarball-lfs-mirror repository, and then pushes them to the remote.

    Uses the GIT_ASKPASS environment variable, and creates a tiny script to
    supply the access token as a password, to avoid having to pass the access
    token anywhere as a commandline parameter.'''
    # check whether there are new commits (and master is therefore ahead of origin/master)
    if subprocess.call(
            "git merge-base --is-ancestor master origin/master",
            shell=True, cwd=tar_repo_dir
    ) == 1:
        print_green("The local tar-file repository has new commits.")
        print("ie new file source mirrors have been created (locally)")
        print("Ready to push changes to the remote repository.")
        if prompt_needed:
            if not PROCEED():
                print_red("Changes not pushed to remote repo")
                return
        push_command = "git push origin master"
        print('>> "' + push_command + '"')
        if git_command_with_askpass(push_command, tar_repo_dir, access_token) != 0:
            # A non-zero return means the process failed
            print_red(
                "Problem with git push. ", "Something went wrong with the 'git push' operation."
                + " You may need to navigate to the " + TAR_REPO_NAME + " repository and"
                + " complete the operation manually."
            )

def git_command_with_askpass(command, repo_dir, access_token):
    '''To complete some subprocess calls with the repository we need to
    authenticate, using the access token, but to avoid passing the access token
    on the command line, we need to use the GIT_ASKPASS variable, and create a
    tiny script that supplies the access token.'''
    with tempfile.TemporaryDirectory(dir=repo_dir) as tmpdir:
        # using tempfile, to ensure that the script file will be deleted no matter what.
        ask_pass_filename = os.path.join(os.path.abspath(tmpdir), 'git-askpass')
        # Create a one-line script that returns the access token:
        script_text = '#!/bin/sh\ncat << EOF\n' + access_token + '\nEOF'
        # First set read & execute permissions for user only.
        askpass_file = os.open(ask_pass_filename, os.O_CREAT | os.O_WRONLY, mode=0o700)
        os.write(askpass_file, script_text.encode(encoding="utf-8"))
        os.close(askpass_file)
        # set environment 'GIT_ASKPASS' to be the name of the script, and supply...
        # ...that environment variable to the 'git push' subprocess.
        askpass_command = "GIT_ASKPASS='" + ask_pass_filename + "' " + command
        # Git therefore invokes the new script, when it needs to get the access token
        # (which is being submitted as a password).
        return subprocess.call(askpass_command, shell=True, cwd=repo_dir)

def get_access_token(access_token_file_name):
    '''Acquires the access token from the specified filename if available, and
    requests it from user input otherwise.'''
    if os.path.exists(access_token_file_name):
        with open(access_token_file_name, mode='r', encoding="utf-8") as token_file:
            return token_file.read().strip()
    else:
        print_green("\nPlease supply a Gitlab API access token.")
        print("(If you run this script regularly, consider saving your access token to a file where"
              + " the script can read it automatically. See help for more info.)")
        print(ACCESS_TOKEN_HELP)
        return input("Access Token: ")

def read_problems_file(problem_file_name):
    """Loads the list of mirrors that need creating, from the supplied filename.
    Prints an error and exits script if the load fails."""
    try:
        with open(problem_file_name, mode='r', encoding="utf-8") as problems_file:
            return json.load(problems_file)
    except FileNotFoundError:
        print_red("Couldn't access file ", problem_file_name)
        print("Try using '-p' to specify the file location.")
        sys.exit(1)

def print_green(green_thing, white_thing=''):
    """Utility function for printing more eyecatching information updates"""
    print(
        f"u001b[32m{green_thing}"
        f"u001b[0m{white_thing}"
    )

def print_red(red_thing, white_thing=''):
    """Utility function for printing more eyecatching information updates"""
    print(
        f"\u001b[31m{red_thing}"
        f"\u001b[0m{white_thing}"
    )

def get_mirror_url_and_proceed(mirror_dict, prompt_needed=True):
    """Checks an entry in the mirror_problems file, looking for the download
    mirror urls.
    -Prints a detailed message about what's about to be created, and presents
    a user prompt, asking whether to proceed.
    -Prints an error message and returns None if no appropriate download url
    exists."""

    print_green("Ready to create mirror for: ", mirror_dict['source_url'])
    if not mirror_dict['mirror_url']:
        print_red("ERROR! Couldn't identify mirror URL")
        return None
    print_green("At new mirror url:   ", mirror_dict['mirror_url'])
    print_green("Source kind:   ", mirror_dict['kind'])
    if prompt_needed:
        if not PROCEED():
            print("Cancelling")
            return None
    return mirror_dict['mirror_url']

def create_git_mirror(gitlab_inst, source_url, top_group, new_mirror_url):
    """creates a new gitlab project, to serve as a download mirror.
    The project is created somewhere under our "mirrors" project group, inside
    an appropriate nested set of subgroups, such that project URL will match
    the desired URL (as specified in the function arguments).

    This is a middle-man function, which calls get_gitlab_group_id() (to find
    the appropriate subgroup, and create it if needed), and create_project()
    (which actually creates the project)"""
    reduced_path = new_mirror_url.replace(GIT_URL_START, '', 1)
    if reduced_path.endswith('.git'):
        reduced_path = reduced_path[:-4]
    if "/" not in reduced_path:
        parent_group_id, project_path = TOP_GROUP_ID, reduced_path
    else:
        relative_group_path, project_path = reduced_path.rsplit('/', 1)
        parent_group_id = get_gitlab_group_id(
            gitlab_inst, top_group, relative_group_path
        )
    create_project(
        gitlab_inst, parent_group_id, project_path, source_url
    )

def get_gitlab_group_id(gitlab_instance, top_group, relative_group_path):
    """Identifies the appropriate subgroup in which to create a new project,
    so that the new project will have the correct URL.
    - Creates such a group, (and necessary parent groups) if it doesn't already
    exist"""
    group_path_list = relative_group_path.split('/')

    parent_group_id = top_group.id
    parent_full_path = top_group.full_path
    for group_path in group_path_list:
        parent_group = gitlab_instance.groups.get(parent_group_id)
        child_full_path = '/'.join([parent_full_path, group_path])
        print("Finding subgroup:   {child_full_path}")

        child_group_id = None
        for subg in parent_group.subgroups.list(all=True):
            if subg.full_path == child_full_path:
                child_group_id = subg.id
                break
        if child_group_id is not None:
            # if we successfully found the child group
            # move one step down the chain
            parent_group_id = child_group_id
            parent_full_path = child_full_path
        else:
            # create the child group
            print('\u001b[1A' + '\u001b[32m' + "Creating subgroup:" + '\u001b[0m')
            child_group = gitlab_instance.groups.create(
                {
                    'name': group_path,
                    'path': group_path,
                    'parent_id': parent_group_id,
                    'visibility': 'public'
                }
            )
            # check that the newly created group has the path we wanted it to:
            if child_group.full_path != child_full_path:
                raise ValueError
            # and move one step down the chain
            parent_group_id = child_group.id
            parent_full_path = child_group.full_path
    return parent_group_id

def create_project(gitlab_instance, parent_group_id, new_project_path, import_url):
    """Creates the actual actual new project, to serve as a download mirror for
    a buildstream source."""
    parent_group = gitlab_instance.groups.get(parent_group_id)
    for existing_project in parent_group.projects.list(all=True, include_subgroups=False):
        if existing_project.path == new_project_path:
            print_red("Repository already exists at ", existing_project.http_url_to_repo)
            return
    new_project = gitlab_instance.projects.create(
        {
            'path': new_project_path,
            'namespace_id': parent_group_id,
            'mirror': True,
            'import_url': import_url,
            'visibility': 'public'
        }
    )
    print_green("Creating new project at: ", new_project.http_url_to_repo)

def initialize_gitlab_instance(access_token):
    """creates a gitlab object (using the python-gitlab library), which will
    be needed to create any git projects to serve as download mirrors.
    Also creates an object to represent the top level "mirrors" project group.

    Prints an error and exists the script, if gitlab authentication fails"""
    try:
        glb = gitlab.Gitlab(GITLAB_URL, private_token=access_token)
        top_group = glb.groups.get(TOP_GROUP_ID)
    except gitlab.exceptions.GitlabAuthenticationError:
        print_red("GITLAB AUTHENTICATION FAILED. ", "Please check your access token and try again.")
        print(ACCESS_TOKEN_HELP)
        sys.exit(1)
    return glb, top_group


def create_file_mirror(source_url, tar_repo_dir, new_mirror_url):
    """Downloads a source file from the original source url (eg a tar or zip
    file), adds it to the file-mirror repository ("tarball-lfs-mirror"), and
    creates a new commit in the repository.

    (This all happens on a local copy of the repository; this function does not
    'git push' the changes back to the remote. Instead, that happens at the
    end of the script, all in one batch.)"""

    reduced_path = new_mirror_url.replace(TAR_URL_START, '', 1)
    if '/' in reduced_path:
        relative_dir_path, filename = reduced_path.rsplit('/', 1)
    else:
        relative_dir_path, filename = '', reduced_path
    dir_path = os.path.join(tar_repo_dir, relative_dir_path)
    if not os.path.isdir(dir_path):
        os.makedirs(dir_path)
    if os.path.exists(os.path.join(dir_path, filename)):
        print_red("File already exists: ", filename)
        return

    for (green_text, white_text, command) in [
            ("downloading file: ", filename, ("wget " + source_url)),
            ("Adding file", "", "git add '" + filename + "'"),
            ("Creating new commit:", "", "git commit -m 'add " + filename + "'"
             + " --author='Automated Python Script <create_mirrors_from_problem_list.py>'"),
    ]:
        print_green(green_text, white_text)
        print('>> "' + command + '"')
        if subprocess.call(command, shell=True, cwd=dir_path) != 0:
            #A zero return means the process worked correctly
            print_red("Something went wrong while trying to create a new commit.")
            print_red("Exiting script")
            print("The script tried to download a new file to the tarball-lfs "
                  + "repository, and add it in a new commit. Something has gone "
                  + "wrong, and the script is exiting without cleaning up the "
                  + "repository. You may need to navigate into the repository and "
                  + "manually delete a file, or reset to an earlier commit, to get "
                  + "the repository back to a suitable 'clean' state before you "
                  + "can re-run this script.")
            sys.exit(1)

def get_repo_path(target_dir):
    '''Returns the correct path for the target repository, based on the target
    supplied on the command line. The path will end with TAR_REPO_NAME'''
    if os.path.basename(target_dir.rstrip('/')) == TAR_REPO_NAME:
        return target_dir.rstrip('/')
    return os.path.join(target_dir, TAR_REPO_NAME)

def initialize_tar_repo(repo_path, access_token, prompt_needed=True):
    """ensures that the script has access to a local copy of the file mirror
    repository ("tarball-lfs-mirror"), located in repo_path.

    Assuming repo_path was generated by get_repo_path(), it is guaranteed to be
    a directory with the same name as TAR_REPO_NAME. If this path already
    exists, then it is assumed to be an existing copy of the repository. Otherwise a
    new copy of the repository is created at this path.

    If it does find an existing repo, it checks out master, and tries to bring
    the local master up to date with remote master.

    If the local master branch has diverged from the remote, or is ahead of the
    remote, then the script fails. (We don't want the script to automatically
    push any changes other than the changes created by the script itself.)"""

    print_red("\n\n\nTo add a mirror for a file, this script needs access \n"
              + "to a copy of the tarball-lfs-mirror repository")
    print("Checking for an up to date copy of the repository")

    folder_exists = os.path.isdir(repo_path)
    if prompt_needed:
        if folder_exists:
            print_green("Found tar repo in ", repo_path)
            print("Ready to bring tar repo up to date with master")
            print_red("IMPORTANT: ", "this script will alter your local copy of"
                      + " the repository, (located in the directory mentioned above), "
                      + "and then attempt to upload the changes to the the remote "
                      + "repository. If you proceed, then the first step is that the "
                      + "script will try to check out the master branch on your local "
                      + "copy, and then attempt to fast-forward merge your local branch"
                      + " to match the remote branch. Do not proceed if you do not want"
                      + " the script to do this.")
        else:
            print_red("Tar file repo doesn't exist in the target folder")
            print_green("Ready to fetch the repository from ", TAR_REPO_URL)
            print(f"Into target folder: {os.path.abspath(repo_path)}")
            print_red("IMPORTANT: ", "this script is about to download the "
                      + "tarball-lfs repository into the directory listed above. This "
                      + "is a large repository (around 10 Gigabytes at time of writing"
                      + ") and may take some time to download. Do not proceed if you "
                      + "do not want to download a large amount of data.\n"
                      + "(if you already have a local copy of the repository then "
                      + "you should cancel this script, then restart it using "
                      + "the -r option to specify the directory of the local copy."
                     )
            print_red("DOWNLOAD SEVERAL GIGABYTES OF DATA?")
        if not PROCEED():
            print_red("Cancelling script")
            sys.exit()
    if folder_exists:
        print_green('Running "git checkout master"')
        if subprocess.call("git checkout master", shell=True, cwd=repo_path) != 0:
            # A non-zero return means the process failed
            report_tar_repo_not_initialized()
        print_green("Fetching from remote:")
        if subprocess.call(
                # "--is-ancestor" tests if the head of the local master branch is
                # level with or behind origin.master.
                # (ie we make sure that there aren't any unpushed commits sitting in local
                # master already, before we add (and push) our own new commits).
                "git fetch origin master && git merge-base --is-ancestor master origin/master",
                shell=True, cwd=repo_path
        ) != 0:
            # A non-zero return means the test failed
            report_tar_repo_not_initialized()
        print_green("Pulling from origin")
        if subprocess.call("git pull origin master", shell=True, cwd=repo_path) != 0:
            report_tar_repo_not_initialized()
    else:
        print_green('Fetching repo:')
        if subprocess.call(args='mkdir -p ' + os.path.abspath(repo_path), shell=True) != 0:
            report_tar_repo_creation_failure()
        for command in [
                'git init',
                "chmod 600 '.git/config'",
                'git remote add origin "' + TAR_REPO_URL + '"',
                'git fetch',
            ]:
            if subprocess.call(args=command, shell=True, cwd=repo_path) != 0:
                report_tar_repo_creation_failure()
        if git_command_with_askpass('git checkout master', repo_path, access_token) != 0:
            report_tar_repo_creation_failure()

    print("File repository ready\n\n\n")
    print("------------------------")
    return True

def report_tar_repo_not_initialized():
    """Prints an error notification, and exits the script.
    Can be called from several places in initialize_tar_repo()."""
    print_red(
        "Couldn't access the tar file repo correctly. ",
        REPO_NOT_CREATED_TEXT
    )
    sys.exit(1)

def report_tar_repo_creation_failure():
    """Prints an error notification, and exits the script.
    Can be called from several places in initialize_tar_repo()."""
    print_red(
        "Something went wrong while creating and accessing the file mirror repository.",
    )
    sys.exit(1)


if __name__ == "__main__":
    main()
