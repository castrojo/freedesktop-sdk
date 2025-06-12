kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst
- components/perl-ssleay.bst

sources:
- kind: cpan
  name: IO::Socket::SSL
  suffix: authors/id/S/SU/SULLR/IO-Socket-SSL-2.091.tar.gz
  sha256sum: c5996e7335912a5c99e06bdb47ff39df309a857cbd8fd2627a021cefdb53cf54
