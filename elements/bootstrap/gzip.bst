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
  url: ftp_gnu_org:gzip/gzip-1.15.tar.xz
  ref: 9aa0cc780dec156b8282844833b342ab7cb08c25d2cd9a1869cdd0df31deff48
- kind: patch
  path: patches/gzip/0001-build-avoid-failure-to-build-on-linux-aarch64.patch
