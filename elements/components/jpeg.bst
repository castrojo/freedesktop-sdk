kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build
- filename: components/nasm.bst
  type: build

variables:
  cmake-local: |
    -DCMAKE_SKIP_RPATH:BOOL=YES \
    -DENABLE_STATIC:BOOL=NO

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
    ignored:
    - CVE-2020-35538

sources:
- kind: git_repo
  url: github:libjpeg-turbo/libjpeg-turbo.git
  track: '2.1.*'
  exclude:
  - '*.*.9*'
  ref: 2.1.5.1-0-g8ecba3647edb6dd940463fedf38ca33a8e2a73d1
