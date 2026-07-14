# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: makemaker

build-depends:
- public-stacks/buildsystem-make.bst

depends:
- public-stacks/runtime-minimal.bst
- components/perl.bst

sources:
- kind: cpan
  name: File::ShareDir::Install
  suffix: authors/id/E/ET/ETHER/File-ShareDir-Install-0.14.tar.gz
  sha256sum: 8f9533b198f2d4a9a5288cbc7d224f7679ad05a7a8573745599789428bc5aea0
