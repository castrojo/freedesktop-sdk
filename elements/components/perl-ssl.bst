kind: makemaker

build-depends:
- bootstrap/make.bst

depends:
- public-stacks/runtime-minimal.bst
- components/perl.bst
- components/perl-ssleay.bst

sources:
- kind: cpan
  name: IO::Socket::SSL
  suffix: authors/id/S/SU/SULLR/IO-Socket-SSL-2.090.tar.gz
  sha256sum: fdda17888df9f88251b62856f17fcac8f144858c72d7e01d1c4b437d23383d97
