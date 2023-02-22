kind: autotools
description: GNU gcc for i686 cross-compiler

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/autoconf2.69.bst
- components/tar.bst
- components/python3.bst
- filename: cross-compilers/glibc-i686.bst
  config:
    location: "%{sysroot}"

depends:
- cross-compilers/build/binutils-cross-i686.bst

(@):
- elements/cross-compilers/i686-vars.yml
- elements/cross-compilers/build/cross-tools.yml
- elements/cross-compilers/build/gcc-cross-common.yml
