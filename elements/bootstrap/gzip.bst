kind: autotools
description: GNU zip

(@):
- elements/bootstrap/include/target.yml

build-depends:
- bootstrap/gnu-config.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/glibc.bst

(?):
- target_arch == "i686":
    variables:
      conf-local: >-
        TIME_T_32_BIT_OK=yes

sources:
- kind: tar
  url: ftp_gnu_org:gzip/gzip-1.14.tar.xz
  ref: 01a7b881bd220bfdf615f97b8718f80bdfd3f6add385b993dcf6efd14e8c0ac6
