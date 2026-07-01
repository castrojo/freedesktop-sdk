# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/patch.bst
- components/_private/git-minimal.bst
- components/help2man.bst
- components/gnupg.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  build-dir: ''

sources:
- kind: git_repo
  url: github:rrthomas/libpaper.git
  track: 'v*'
  ref: v2.2.8-0-g800a61a0172da9dbb9ac19b0231459345890a586
- kind: git_module
  path: gnulib
  url: savannah:gnulib.git
  ref: 3766806904396257b098d800c04c996306ff9517
