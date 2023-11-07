kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst
- components/perl-ssleay.bst

sources:
- kind: cpan
  name: IO::Socket::SSL
  suffix: authors/id/S/SU/SULLR/IO-Socket-SSL-2.084.tar.gz
  sha256sum: a60d1e04e192363155329560498abd3412c3044295dae092d27fb6e445c71ce1
