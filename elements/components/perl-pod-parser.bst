kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst

sources:
- kind: cpan
  name: Pod::Parser
  url: cpan:authors/id/M/MA/MAREKR/Pod-Parser-1.65.tar.gz
  sha256sum: 3ba7bdec659416a51fe2a7e59f0883e9c6a3b21bc9d001042c1d6a32d401b28a
