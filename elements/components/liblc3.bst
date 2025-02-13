kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/liblc3.so'

sources:
- kind: git_repo
  url: github:google/liblc3.git
  track: v*
  ref: v1.1.3-0-g96a3af0beb5487aca3b98a4b992a539a1f6d80d1
