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
  ref: v2.3.4-0-ge5b32d5395582d027c3d68d7dbdf92e961bdc9c8
