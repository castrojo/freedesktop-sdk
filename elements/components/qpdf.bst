kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/libxslt.bst
- components/docbook-xsl.bst

depends:
- components/gnutls.bst
- components/jpeg.bst

sources:
- kind: git_tag
  url: github:qpdf/qpdf.git
  track: main
  exclude:
  - '*cmake*'
  ref: v11.2.0-0-g562ff1b6087a16a47ec5bc18fb765910541b1167
