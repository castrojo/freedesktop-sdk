kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/nasm.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  cmake-local: >-
    -DCMAKE_SKIP_RPATH:BOOL=YES  -DENABLE_STATIC:BOOL=NO

  optimize-debug: "false"

config:
  install-commands:
    (>):
    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}/"
      mv "%{install-root}%{includedir}/jconfig.h" "%{install-root}%{prefix}/include/%{gcc_triplet}/"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libjpeg.so'
        - '%{libdir}/libturbojpeg.so'
  cpe:
    product: libjpeg-turbo

sources:
- kind: git_repo
  url: github:libjpeg-turbo/libjpeg-turbo.git
  track: '*.*.*'
  exclude:
  - '*.*.9*'
  ref: 3.1.1-0-g7723f50f3f66b9da74376e6d8badb6162464212c
