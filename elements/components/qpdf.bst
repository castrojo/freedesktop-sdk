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
  ref: v11.1.0-0-gda67a0aa043c2c8ad129fbc87b93afcdab7042a7
