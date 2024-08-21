kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/mpfr.bst
- components/python3.bst

sources:
- kind: git_repo
  url: github:storaged-project/libbytesize.git
  track: '*.*'
  ref: 2.11-0-g9da72b2732508b0ba0ceed27f5e50bc276ef31f2
