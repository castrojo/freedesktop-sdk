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
  ref: v12.4.0-0-gbabad179ce5db9a21635c8d1ac17baa59637eada
