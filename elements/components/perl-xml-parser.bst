kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst
- components/expat.bst

sources:
- kind: cpan
  name: XML::Parser
  suffix: authors/id/T/TO/TODDR/XML-Parser-2.51.tar.gz
  sha256sum: 61b07878ff5095375fbbf095c1779808d6d99cf142a176bbf8900f42604e82eb
