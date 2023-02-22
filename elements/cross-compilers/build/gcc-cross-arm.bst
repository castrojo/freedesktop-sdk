kind: autotools
description: GNU gcc for ARM cross-compiler

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/autoconf2.69.bst
- components/tar.bst
- components/python3.bst
- filename: cross-compilers/glibc-arm.bst
  config:
    location: "%{sysroot}"

depends:
- cross-compilers/build/binutils-cross-arm.bst

(@):
- elements/cross-compilers/arm-vars.yml
- elements/cross-compilers/build/cross-tools.yml
- elements/cross-compilers/build/gcc-cross-common.yml
