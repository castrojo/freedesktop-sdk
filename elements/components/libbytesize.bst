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
  ref: 2.7-0-g0f47dde41f92f00b12160387659501edefd05b38
