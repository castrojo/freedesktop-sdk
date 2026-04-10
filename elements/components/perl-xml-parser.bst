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
  suffix: authors/id/T/TO/TODDR/XML-Parser-2.57.tar.gz
  sha256sum: a846bf77032e953e8344989780fa6a885e2a5226ebcaa93dae1d3df9b184e9cf
