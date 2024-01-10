kind: makemaker

depends:
- bootstrap-import.bst
- components/perl.bst

sources:
- kind: cpan
  name: 'Pod::Parser'
  suffix: authors/id/M/MA/MAREKR/Pod-Parser-1.67.tar.gz
  sha256sum: 5deccbf55d750ce65588cd211c1a03fa1ef3aaa15d1ac2b8d85383a42c1427ea
