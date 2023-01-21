kind: autotools

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

(@): elements/bootstrap/include/target.yml

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
  url: ftp_gnu_org:diffutils/diffutils-3.9.tar.xz
  ref: d80d3be90a201868de83d78dad3413ad88160cc53bcc36eb9eaf7c20dbf023f1
