kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst
- components/perl-ssleay.bst

sources:
- kind: cpan
  name: IO::Socket::SSL
  suffix: authors/id/S/SU/SULLR/IO-Socket-SSL-2.086.tar.gz
  sha256sum: a547617395f508669916064abb0aa61a7acba8f950dbb1924f83c9f0be31dd11
