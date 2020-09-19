kind: autotools

build-depends:
- bootstrap/gnu-config.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
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
  url: ftp_gnu_org:diffutils/diffutils-3.7.tar.xz
  ref: b3a7a6221c3dc916085f0d205abf6b8e1ba443d4dd965118da364a1dc1cb3a26
