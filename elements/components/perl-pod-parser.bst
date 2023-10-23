kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst

sources:
- kind: cpan
  name: 'Pod::Parser'
  suffix: authors/id/M/MA/MAREKR/Pod-Parser-1.66.tar.gz
  sha256sum: 22928a7bffe61b452c05bbbb8f5216d4b9cf9fe2a849b776c25500d24d20df7c
