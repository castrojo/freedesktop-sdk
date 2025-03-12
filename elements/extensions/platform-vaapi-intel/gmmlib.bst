kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -DCMAKE_INSTALL_LIBDIR="%{libdir}/dri/intel-vaapi-driver/lib"
    -DRUN_TEST_SUITE:BOOL=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/dri/intel-vaapi-driver/lib/libigdgmm.so"
        - "%{libdir}/dri/intel-vaapi-driver/lib/pkgconfig"
        - "%{libdir}/dri/intel-vaapi-driver/lib/pkgconfig/*"

sources:
- kind: git_repo
  url: github:intel/gmmlib.git
  track: intel-gmmlib-*
  exclude:
  - 'intel-gmmlib-*.pre*'
  ref: intel-gmmlib-22.7.0-0-g8325c5683b4c68301cd5515a37bd72529cee596d
