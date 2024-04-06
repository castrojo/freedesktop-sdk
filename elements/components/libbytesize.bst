kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/mpfr.bst
- components/python3.bst

sources:
- kind: git_repo
  url: github:storaged-project/libbytesize.git
  track: '*.*.*'
  ref: 2.9-0-g2fa27aa3acccc70b9f6c3bf2e569e3d33a381e83
