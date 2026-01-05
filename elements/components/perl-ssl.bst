kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst
- components/perl-ssleay.bst

sources:
- kind: cpan
  name: IO::Socket::SSL
  suffix: authors/id/S/SU/SULLR/IO-Socket-SSL-2.096.tar.gz
  sha256sum: 576a37b6850a5972f320488c1b5408ff7c13699facfbe59089d5b41b4a71b9ac
