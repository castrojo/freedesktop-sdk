# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: makemaker

build-depends:
- public-stacks/buildsystem-make.bst

depends:
- public-stacks/runtime-minimal.bst
- components/perl-class-inspector.bst
- components/perl.bst

sources:
- kind: cpan
  name: File::ShareDir
  suffix: authors/id/R/RE/REHSACK/File-ShareDir-1.118.tar.gz
  sha256sum: 3bb2a20ba35df958dc0a4f2306fc05d903d8b8c4de3c8beefce17739d281c958
