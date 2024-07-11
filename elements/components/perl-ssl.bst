kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst
- components/perl-ssleay.bst

sources:
- kind: cpan
  name: IO::Socket::SSL
  suffix: authors/id/S/SU/SULLR/IO-Socket-SSL-2.087.tar.gz
  sha256sum: 936a46c58312df272313fedb4bb39faea7481629c163d83a8cdd283a0e28c578
