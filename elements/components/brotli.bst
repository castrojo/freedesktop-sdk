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
  ref: v1.2.0-0-g028fb5a23661f123017c060daa546b55cf4bde29
