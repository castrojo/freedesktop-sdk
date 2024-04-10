# Release Process

1. Run the helper script from the master<sup>*</sup> branch to prepare a release, e.g.:

   ```
   $ ./utils/release.py prepare release/23.08 freedesktop-sdk-23.08.1
   Preparing worktree (new branch 'news/freedesktop-sdk-23.08.1')
   Generating changelog for changes since freedesktop-sdk-23.08.0
   To submit an MR for the release branch run:
       git push -o merge_request.create -o merge_request.target=release/23.08 -o 'merge_request.title=Draft: NEWS: Update for freedesktop-sdk-23.08.1' origin news/freedesktop-sdk-23.08.1

   ```

   `*` This ensures you are running the latest version of `release.py`. You don't need to run the script from the branch you are creating a release for, the script will create the release notes based on top of the latest commit of the branch specified.

1. Run the `git push` command suggested by the helper script to create a draft NEWS MR

1. Run `git describe` against the generated branch and keep note of the output, e.g.:

   ```
   $ git describe --tags --abbrev=40 news/freedesktop-sdk-23.08.1
   freedesktop-sdk-23.08.0-107-g1adcf1ffdee8cff486d23e70279304f70cec1ec4
   ```

1. Create merge requests for each relevant `gnome-build-meta` branch, updating the `ref` field in `freedesktop-sdk.bst` to the output of the previous `git describe` step

1. Start a discussion on the draft NEWS MR with links to the `gnome-build-meta` merge requests you have just created

1. Await successful builds of all MRs created in preparation for the release

1. Mark the generated `freedesktop-sdk` NEWS MR as ready

1. Wait for the NEWS MR to be reviewed and merged

1. Run the helper script to create and push a GPG signed tag and create a GitLab release, e.g.:

   ```
   $ ./utils/release.py publish glpat-XXXXX freedesktop-sdk-23.08.1 82ccd27bb92aa3934f8c2ff62bbe46ae4af7adf4
   ```
