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
  suffix: authors/id/S/SU/SULLR/IO-Socket-SSL-2.095.tar.gz
  sha256sum: 7e764392b1b8bd44e654183c082b75be47800e98d7cd325f0e1b76c7d9a6b768
