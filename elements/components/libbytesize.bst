kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/mpfr.bst
- components/python3.bst

sources:
- kind: git_tag
  url: github:storaged-project/libbytesize.git
  track: master
  ref: 2.8-0-g12b8e6bff611eecb0343ee8a765151e7d9d3547b
