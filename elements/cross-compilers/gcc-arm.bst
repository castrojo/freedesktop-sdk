kind: autotools

build-depends:
- bootstrap-import.bst
- components/tar.bst
- cross-compilers/standard-libs-arm.bst
- public-stacks/buildsystem-autotools.bst
- components/texinfo.bst
- components/autoconf2.69.bst
- components/flex.bst

depends:
- cross-compilers/binutils-arm.bst

(@):
- elements/cross-compilers/arm-vars.yml
- elements/cross-compilers/gcc-common.yml
- elements/include/gcc-source.yml

variables:
  conf-arch: >-
    --with-mode=thumb
    --with-fpu=vfpv3-d16
    --with-arch=armv7-a
    --with-float=hard
