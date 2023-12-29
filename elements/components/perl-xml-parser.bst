kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst
- components/expat.bst

sources:
- kind: cpan
  name: XML::Parser
  url: cpan:authors/id/T/TO/TODDR/XML-Parser-2.47.tar.gz
  sha256sum: ad4aae643ec784f489b956abe952432871a622d4e2b5c619e8855accbfc4d1d8
