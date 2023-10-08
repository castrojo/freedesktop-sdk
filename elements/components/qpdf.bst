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
  ref: v11.6.2-0-g467e5d6226d6b609069d7703cd1edc1552aa62bc
