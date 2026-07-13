# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: makemaker

(@):
- include/strip.yml

build-depends:
- public-stacks/buildsystem-make.bst
- components/perl-file-sharedir-install.bst

depends:
- public-stacks/runtime-minimal.bst
- components/expat.bst
- components/perl.bst
- components/perl-file-sharedir.bst

sources:
- kind: cpan
  name: XML::Parser
  suffix: authors/id/T/TO/TODDR/XML-Parser-2.59.tar.gz
  sha256sum: a358fd7c49f5e27717a644a9102bd21dc7fc25a415983279c59b1580e2b62a58
