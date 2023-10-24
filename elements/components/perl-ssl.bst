kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst
- components/perl-ssleay.bst

sources:
- kind: cpan
  name: IO::Socket::SSL
  suffix: authors/id/S/SU/SULLR/IO-Socket-SSL-2.083.tar.gz
  sha256sum: 904ef28765440a97d8a9a0df597f8c3d7f3cb0a053d1b082c10bed03bc802069
