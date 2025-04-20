kind: autotools


build-depends:
- public-stacks/buildsystem-autotools.bst
- components/ruby.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  conf-local: >-
    --enable-custom-vendordir="%{libdir}/GL/OpenCL/vendors"
    --disable-update-database

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libOpenCL.so'

sources:
- kind: git_repo
  url: github:OCL-dev/ocl-icd.git
  track: v*
  ref: v2.3.3-0-g2faf7063c91fdb0f2471f98bf5b2c49c8f907423
