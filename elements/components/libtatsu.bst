# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst

depends:
- public-stacks/runtime-minimal.bst
- components/curl.bst
- components/libplist.bst

sources:
- kind: git_repo
  url: github:libimobiledevice/libtatsu.git
  track: '*.*.*'
  ref: 1.1.0-0-gd8928042bcbb7048bc87a994d3e84c29eacf2f32
