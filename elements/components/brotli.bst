kind: cmake

build-depends:
- bootstrap-import.bst
- public-stacks/buildsystem-cmake.bst

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
- kind: git_repo
  url: github:google/brotli.git
  track: v*
  exclude:
  - "*rc*"
  ref: v1.1.0-0-ged738e842d2fbdf2d6459e39267a633c4a9b2f5d
