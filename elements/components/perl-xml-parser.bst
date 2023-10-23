kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst
- components/expat.bst

sources:
- kind: cpan
  name: XML::Parser
  suffix: authors/id/T/TO/TODDR/XML-Parser-2.46.tar.gz
  sha256sum: d331332491c51cccfb4cb94ffc44f9cd73378e618498d4a37df9e043661c515d
