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
  - '*cmake*'
  ref: v11.9.1-0-gc03ee7aa663c4361e23ca32b596adf6e8be0e8ac
