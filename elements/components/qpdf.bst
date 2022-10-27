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
  ref: v11.1.1-0-g236a02d40267e3ed99a535b69b7a779bc0b09e80
