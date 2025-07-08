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
  conf-local: >-
    gl_cv_func_getopt_gnu=yes
    gl_cv_func_strcasecmp_works=yes

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: tar
  url: ftp_gnu_org:diffutils/diffutils-3.10.tar.xz
  ref: 90e5e93cc724e4ebe12ede80df1634063c7a855692685919bfe60b556c9bd09e
