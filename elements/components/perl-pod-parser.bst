kind: makemaker

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/make.bst

depends:
- public-stacks/runtime-minimal.bst
- components/perl.bst

sources:
- kind: cpan
  name: 'Pod::Parser'
  suffix: authors/id/M/MA/MAREKR/Pod-Parser-1.67.tar.gz
  sha256sum: 5deccbf55d750ce65588cd211c1a03fa1ef3aaa15d1ac2b8d85383a42c1427ea
