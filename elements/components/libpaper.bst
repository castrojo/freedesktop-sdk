# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst
- components/gnupg.bst
- components/help2man.bst
- components/patch.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  build-dir: ''

sources:
- kind: git_repo
  url: github:rrthomas/libpaper.git
  track: 'v*'
  ref: v2.3.0-0-g0d3f4636ca3ee454a64c86e8ae5e518be79b665d
- kind: git_module
  path: gnulib
  url: savannah:gnulib.git
  ref: 3766806904396257b098d800c04c996306ff9517
