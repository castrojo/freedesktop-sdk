# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: makemaker

build-depends:
- bootstrap/make.bst

depends:
- public-stacks/runtime-minimal.bst
- components/perl.bst

sources:
- kind: cpan
  name: YAML::Tiny
  suffix: authors/id/E/ET/ETHER/YAML-Tiny-1.76.tar.gz
  sha256sum: a8d584394cf069bf8f17cba3dd5099003b097fce316c31fb094f1b1c171c08a3
