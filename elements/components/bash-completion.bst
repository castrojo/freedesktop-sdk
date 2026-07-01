# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/sed.bst

sources:
- kind: git_repo
  url: github:scop/bash-completion.git
  track: '*.*'
  ref: 2.17.0-0-g47cc2eb87af2f95bc3a6b13ccebe6bd39b1b107a
