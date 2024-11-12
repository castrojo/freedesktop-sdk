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
  suffix: authors/id/S/SU/SULLR/IO-Socket-SSL-2.089.tar.gz
  sha256sum: f683112c1642967e9149f51ad553eccd017833b2f22eb23a9055609d2e3a14d1
