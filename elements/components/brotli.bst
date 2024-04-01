kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/bc.bst
  type: build

variables:
  autogen: ./bootstrap

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{bindir}/brotli"
        - "%{libdir}/libbrotlicommon.so"
        - "%{libdir}/libbrotlidec.so"
        - "%{libdir}/libbrotlienc.so"

sources:
- kind: git_tag
  url: github:google/brotli.git
  ref: v1.0.9-0-ge61745a6b7add50d380cfd7d3883dd6c62fc2c71
- kind: patch
  path: patches/brotli/fix-pkg-config.patch
