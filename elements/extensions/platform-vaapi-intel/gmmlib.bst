kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

variables:
  licensedir: "%{libdir}/dri/intel-vaapi-driver/share/licenses"
  cmake-local: >-
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
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
  ref: intel-gmmlib-22.8.1-0-g246fa363c772d90575357e08900a4431f1374673
