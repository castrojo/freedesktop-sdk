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
  ref: 1.1.1-0-g726b6fa32fc86d56c9022b260df2de525a444aea
