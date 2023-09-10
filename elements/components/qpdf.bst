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
  ref: v11.6.1-0-gb352791a07a5488e6f1f67220ddce147d20aa26a
