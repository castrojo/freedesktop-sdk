kind: autotools
description: GNU gcc for AArch64 cross-compiler

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/autoconf2.69.bst
- components/tar.bst
- components/python3.bst
- filename: cross-compilers/glibc-aarch64.bst
  config:
    location: "%{sysroot}"

depends:
- cross-compilers/build/binutils-cross-aarch64.bst

(@):
- elements/cross-compilers/aarch64-vars.yml
- elements/cross-compilers/build/cross-tools.yml
- elements/cross-compilers/build/gcc-cross-common.yml
