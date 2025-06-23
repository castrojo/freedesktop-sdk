kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

variables:
  licensedir: "%{libdir}/dri/intel-vaapi-driver/share/licenses"
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
  ref: intel-gmmlib-22.9.0-0-g5f1c01f46ecbfceec59faef9bf3ba4625fc88fed
