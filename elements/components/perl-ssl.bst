kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst
- components/perl-ssleay.bst

sources:
- kind: cpan
  name: IO::Socket::SSL
  suffix: authors/id/S/SU/SULLR/IO-Socket-SSL-2.085.tar.gz
  sha256sum: 95b2f7c0628a7e246a159665fbf0620d0d7835e3a940f22d3fdd47c3aa799c2e
