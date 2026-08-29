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
  ref: v12.4.1-0-gc37f83ae468abb6cc741f43b2f6fdeb66e550ffb
