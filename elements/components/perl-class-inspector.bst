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
  name: Class::Inspector
  suffix: authors/id/P/PL/PLICEASE/Class-Inspector-1.36.tar.gz
  sha256sum: cc295d23a472687c24489d58226ead23b9fdc2588e522f0b5f0747741700694e
