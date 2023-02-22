kind: autotools

build-depends:
- cross-compilers/build/gcc-cross-host.bst
- components/texinfo.bst
- components/bison.bst
- components/flex.bst
- filename:
  - cross-compilers/glibc-host.bst
  - cross-compilers/zlib-host.bst
  - cross-compilers/elfutils-host.bst
  config:
    location: "%{sysroot}"

(@):
- elements/cross-compilers/target.yml
- elements/cross-compilers/aarch64-vars.yml
- elements/bootstrap/include/binutils-source.yml
- elements/cross-compilers/binutils-common.yml
