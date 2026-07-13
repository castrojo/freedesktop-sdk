# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libplist.bst
- components/curl.bst

sources:
- kind: git_repo
  url: github:libimobiledevice/libtatsu.git
  track: '*.*.*'
  ref: 1.0.5-0-g42329cb756682535c7c0f087987b78d1dd5b16c8
