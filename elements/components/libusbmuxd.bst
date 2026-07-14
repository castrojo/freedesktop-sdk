# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libimobiledevice-glue.bst
- components/libplist.bst

sources:
- kind: git_repo
  url: github:libimobiledevice/libusbmuxd.git
  track: '*.*.*'
  ref: 2.1.1-0-gadf9c22b9010490e4b55eaeb14731991db1c172c
