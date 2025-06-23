kind: autotools

(@):
- include/_private/autotools-recc.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- components/mpfr.bst
- components/python3.bst

sources:
- kind: git_repo
  url: github:storaged-project/libbytesize.git
  track: '*.*'
  ref: 2.12-0-g518fd4a0a863e896675a7f5ef0164a36eb4d7b03
