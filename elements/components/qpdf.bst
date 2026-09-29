kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/libxslt.bst
- components/docbook-xsl.bst

depends:
- components/gnutls.bst
- components/jpeg.bst

sources:
- kind: git_repo
  url: github:qpdf/qpdf.git
  track: v*
  exclude:
  - "vcpkg*"
  ref: v12.4.2-0-g4eba95899886e851cc41d76886483b347612f2a8
