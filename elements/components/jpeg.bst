kind: cmake

depends:
- public-stacks/runtime-minimal.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build
- filename: components/nasm.bst
  type: build

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
  ref: 3.1.0-0-g20ade4dea9589515a69793e447a6c6220b464535
