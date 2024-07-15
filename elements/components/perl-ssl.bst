kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst
- components/perl-ssleay.bst

sources:
- kind: cpan
  name: IO::Socket::SSL
  suffix: authors/id/S/SU/SULLR/IO-Socket-SSL-2.088.tar.gz
  sha256sum: 9d27a31f0b617022180a1d1c45664beb76f51f3b8caede1404072a87dab74536
