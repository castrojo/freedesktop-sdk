kind: autotools
description: GNU gcc for x86_64 cross-compiler

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/autoconf2.69.bst
- components/tar.bst
- components/python3.bst
- filename: cross-compilers/glibc-x86_64.bst
  config:
    location: "%{sysroot}"

depends:
- cross-compilers/build/binutils-cross-x86_64.bst

(@):
- elements/cross-compilers/x86_64-vars.yml
- elements/cross-compilers/build/cross-tools.yml
- elements/cross-compilers/build/gcc-cross-common.yml
