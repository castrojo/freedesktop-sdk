kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst
- components/perl-ssleay.bst

sources:
- kind: cpan
  name: IO::Socket::SSL
  suffix: authors/id/S/SU/SULLR/IO-Socket-SSL-2.093.tar.gz
  sha256sum: ef5295964251bb688150aa9e32c881f3c6d1d8f435b595c9e3b37ad729ca1e44
