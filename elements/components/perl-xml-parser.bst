kind: makemaker

build-depends:
- components/perl-file-sharedir-install.bst

depends:
- bootstrap-import.bst
- components/expat.bst
- components/perl.bst
- components/perl-file-sharedir.bst

sources:
- kind: cpan
  name: XML::Parser
  suffix: authors/id/T/TO/TODDR/XML-Parser-2.58.tar.gz
  sha256sum: 8e0bd510a6095374aff14e4f0cea62c40df5c434ac703850f20ae8edb2c9b100
