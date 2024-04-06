kind: autotools


build-depends:
- public-stacks/buildsystem-autotools.bst
- components/ruby.bst

depends:
- bootstrap-import.bst

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
  ref: v2.3.2-0-gfdde6677b21329432db8b481e2637cd10f7d3cb2
