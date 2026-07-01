# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

build-depends:
- public-stacks/buildsystem-make.bst

depends:
- public-stacks/runtime-minimal.bst
- components/perl.bst
- components/perl-xml-parser.bst

sources:
- kind: git_repo
  url: github:atsb/xmltoman.git
  track: '*.*'
  ref: 0.6-0-g46403b9cf0191b40971ed89402da8c1b852781ad
- kind: patch
  path: patches/xmltoman/0001-Makefile-Use-PREFIX-instead-of-prefix.patch
