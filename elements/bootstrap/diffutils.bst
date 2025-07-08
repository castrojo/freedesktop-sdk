kind: autotools

(@):
- elements/bootstrap/include/target.yml

build-depends:
- bootstrap/base-sdk/texinfo.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- bootstrap/gnu-config.bst
- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/glibc.bst

variables:
  conf-local: |
    gl_cv_func_getopt_gnu=yes

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: tar
  url: ftp_gnu_org:diffutils/diffutils-3.12.tar.xz
  ref: 7c8b7f9fc8609141fdea9cece85249d308624391ff61dedaf528fcb337727dfd
