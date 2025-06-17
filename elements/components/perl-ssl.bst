kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst
- components/perl-ssleay.bst

sources:
- kind: cpan
  name: IO::Socket::SSL
  suffix: authors/id/S/SU/SULLR/IO-Socket-SSL-2.092.tar.gz
  sha256sum: 0f68331ff0b033441bcf00355bca74b2ceb799a45fd1661d47e0c0ab9610e8f4
