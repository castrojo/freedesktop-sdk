kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libebur128.so'

sources:
- kind: git_repo
  url: github:jiixyj/libebur128.git
  track: v*
  ref: v1.2.6-0-g67b33abe1558160ed76ada1322329b0e9e058b02
