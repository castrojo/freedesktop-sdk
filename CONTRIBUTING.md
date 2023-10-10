# Contributing

Look [here](https://gitlab.com/freedesktop-sdk/freedesktop-sdk/wikis/release) for information about branching.

This document outlines the basic guidelines before contributing to freedesktop-sdk. If you want to contribute to this project please follow the steps below.

In order to contribute your first patch, you will need to follow these steps:
1. [Create a GitLab account](#create-a-gitlab-account)
2. [Clone our GitLab repo](#clone-our-gitlab-repo)
3. [Make a local branch](#make-a-local-branch)
4. [Make your changes in the branch](#make-your-changes-in-the-branch)
5. [Request developer access to the freedesktop-sdk repo](#request-developer-access-to-the-freedesktop-sdk-repo)
6. [Push your changes to the remote](#push-your-changes-to-the-remote)
7. [Open a merge request](#open-a-merge-request)

Additionally you can [test your changes](#testing-locally) locally using our Makefile

## Help & Contact
If this guide does not answer your questions, or you encounter any problems you can contact us at:
- [#freedesktop-sdk:matrix.org](https://matrix.to/#/#freedesktop-sdk:matrix.org) on Matrix
- [mailing list](https://lists.freedesktop.org/mailman/listinfo/freedesktop-sdk).

Let's go through each step in more detail:
## Create a GitLab account
Simply click "sign in/register" in the top right corner and fill in the form.

## Clone our GitLab repo
Open a terminal and type:
```
git clone https://gitlab.com/freedesktop-sdk/freedesktop-sdk.git
```
If you have an SSH key associated with your GitLab account you can alternatively type
```
git clone git@gitlab.com:freedesktop-sdk/freedesktop-sdk.git
```
to avoid having to type your password when pushing.

Please make sure that your git is connected with your email and name using
```
git config user.name "MY_NAME"
git config user.email "MY_EMAIL@example.com"
```

There are also many GUI git interfaces, such as integration with IDEs and GitHub's UI, however running through all of these alternative methods would be a mammoth task. Feel free to add instructions for your personal preferred git workflow.

## Make a local branch
[//]: # (If someone knows a better way to do this please tell me)
Make sure you're within the `freedesktop-sdk` directory and use the command
```
git checkout master
```
to make sure you're branching from the current development branch. If you are
targeting a specific release of freedesktop-sdk then you simply need to replace
master with the relevant release branch, for example `19.08`. Now run
```
git checkout -b my-branch-name
```
Your branch should be named something suitable for the changes you will be making. We also usually include our GitLab username in the branch name as `username/suitable-branch-name`

## Make your changes in the branch
Create the necessary changes to fix your bug/add your feature.

When writing commit messages follow these rules:
1. Separate subject from body with a blank line - This makes your commit easier to read
2. Limit the subject line to 50 characters - Subject lines should be short and to the point
3. Capitalise the subject line - This is stylistic, but makes things clearer
4. Do not end the subject line with a period - Trailing punctuation is an unnecessary waste of space
5. Use the imperative case in the subject line i.e. As an instruction (e.g. Clean up x.bst) - This makes it clearer what your patch does
6. Wrap the body at 72 characters - This makes reading your messages easier for people with small displays
7. Use the body to explain what and why, rather than how - When looking through the git history at changes it may not be obvious *why* a change was implemented, making code impossible to maintain

For more information on git commit messages see [this guide](https://chris.beams.io/posts/git-commit/#seven-rules/).

## When modifying a git source
We use tools to track versions/security vulnerabilities, this requires us to
track the exact version number we are using.

Freedesktop-sdk does not utilise a traditional sha format, we combine
the version number, number of commits from the tag(HEAD) and then the sha,
which is easier to parse and automate.

When modifying a "ref" (bst sha) for a git source, you need to generate a new
ref format for the new version, this is possible by running:

```
git describe --tags --long --abbrev=40

```

Which should produce something like:

```
freedesktop-sdk-18.08.18-116-g30eb35057d1e2b0beb539b92d3af6708c252d21b

```

This ref clearly states the project version in a human readable format, whilst
also making it easier to regex/automate the parsing of the version by other
tools.

We also have CI to automatically track the latest tags of git repos, but this
requires use of the `git_repo` plugin rather than `git`. If adding a new git
source please use `git_repo` rather than `git`.


## Request developer access to the freedesktop-sdk repo
Go to our GitLab [project page](https://gitlab.com/freedesktop-sdk/freedesktop-sdk) and click the "Request Developer Access" button near the top of the page. One of the maintainers will review your request. Developer access allows you to push directly to our repo, enabling a simpler "push and merge request" workflow instead of using the GitHub "fork and pull request" workflow.
This has the added benefit of allowing you to use our CI, which is equipped with runners for aarch64, armv7, i686 and x86_64 architectures.

## Push your changes to the remote
Run the following commands:

```
git push --set-upstream origin my-branch-name
```
Your branch will now begin going through our CI runners, which build the SDK on multiple architectures to ensure that your changes have not caused a break anywhere. Additionally it will check for ABI changes.

Crypto components may break forward ABI (not backward ABI) compatibility for security updates on a stable branch

It is also good practice to rebase your changes before pushing (so that your commits are on top of the target branch), to do this run
```
git rebase origin/19.08
```
while your branch is checked out. This may require you to force-push your branch, to do this add the `-f` switch to the git push command.

## Open a merge request
Navigate to the [New Merge Request Page](https://gitlab.com/freedesktop-sdk/freedesktop-sdk/merge_requests/new) on our GitLab, add your branch as the source branch and 19.08 as the target branch.
Once your MR is open it will be reviewed before merging. Once it passes our CI and any discussions are resolved, it will be assigned to our merge bot, which will continually rebase onto the latest commit in 19.08 until it merges your branch.

Congratulations, you are now a freedesktop-sdk contributor!

*NOTE*
MRs can be in "review" for a maximum of 6 months, after this time limit, if the MR is not
blocked or frozen for a future release, a maintainer will message to check if anything is
blocking the MR or if any assistance is needed, if there is no response or it is deemed to be no
longer required, then the MR will be *closed*.

## Testing locally
If you want to test your changes locally then you will need to first install [BuildStream](https://buildstream.build). The installation instructions can be found [here](https://buildstream.build/install.html). Note that we use the latest stable version of BuildStream, so ensure you use this version too (otherwise you may not hit our cache server, and have to build everything from scratch). At time of writing, we use BuildStream 2.1.

The Makefile can be used to produce freedesktop-sdk as both a flatpak repo and tarballs, using the commands outlined in the table below.

After making your changes you can use the Makefile to test. Ensure you are in the root `freedesktop-sdk/` directory, where the Makefile is located. You can use the Makefile to:

The Makefile provides several targets that can be used to test or distribute
freedesktop-sdk. The table below outlines them and their uses.

| Action                                            | Command                  |
| ------------------------------------------------- | ------------------------ |
| Build the Project                                 | `make build`             |
| Build tarballs of freedesktop-sdk                 | `make build-tar`         |
| Build VM images of freedesktop-sdk                | `make build-vm`          |
| Build and checkout the bootstrap                  | `make bootstrap`         |
| Build and checkout as a flatpak repo              | `make export`            |
| Build and export snap images                      | `make export-snap`       |
| Build and export tarballs of freedesktop-sdk      | `make export-tar`        |
| Build and export OCI images of freedesktop-sdk    | `make export-oci`        |
| Build and export docker images of freedesktop-sdk | `make export-docker`     |
| Build and run VM images of freedesktop-sdk        | `make run-vm`            |
| Build and export manifests for platform and sdk   | `make manifest`          |
| Convert manifests to human-readable format        | `make markdown-manifest` |
| Check for dev files in the Platform               | `make check-dev-files`   |
| Check for components using rpath                  | `make check-rpath`       |
| Test some basic apps                              | `make test-apps`         |
| Test the codec extensions behave as intended      | `make test-codecs`       |
| Track the mesa-git extension                      | `make track-mesa-git`    |

**NOTE:** You must run `make export` *before* running `make test-apps`

There are additionally several variables a user can define to customise the
build, below is a selection of the more useful ones, as most are just building
up from the other variables or used in CI:

| Variable        | Effect                                                                          | Default Value |
| --------------- | ------------------------------------------------------------------------------- | ------------- |
| ARCH            | Export as flatpak with architecture ARCH                                        | system arch   |
| BRANCH          | Name of the flatpak branch                                                      | git branch    |
| REPO            | The local flatpak repo to export to                                             | "repo/"       |
| CHECKOUT_ROOT   | The location to checkout runtimes from bst checkout                             | "runtimes/"   |
