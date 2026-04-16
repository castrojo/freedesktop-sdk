kind: makemaker

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/make.bst

depends:
- public-stacks/runtime-minimal.bst
- components/perl.bst
- components/perl-ssleay.bst

sources:
- kind: cpan
  name: IO::Socket::SSL
  suffix: authors/id/S/SU/SULLR/IO-Socket-SSL-2.098.tar.gz
  sha256sum: b38473be20256b1a06447dd6769ad162bfad6a258234ed2c7e2e1819c16c4df7
