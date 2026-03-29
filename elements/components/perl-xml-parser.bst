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
  suffix: authors/id/T/TO/TODDR/XML-Parser-2.54.tar.gz
  sha256sum: 803bcd50eaf1fda0820056bb1ec485cdd1c04bca680394879b5e6a0be35597c6
