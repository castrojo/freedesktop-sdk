kind: autotools

build-depends:
- cross-compilers/build/gcc-cross-host.bst
- cross-compilers/build/gcc-cross-aarch64.bst
- components/tar.bst
- public-stacks/buildsystem-autotools.bst
- components/texinfo.bst
- components/autoconf2.69.bst
- filename:
  - cross-compilers/glibc-host.bst
  - cross-compilers/elfutils-host.bst
  - cross-compilers/standard-libs-aarch64.bst
  config:
    location: "%{sysroot}"

depends:
- cross-compilers/binutils-aarch64.bst

(@):
- elements/cross-compilers/target.yml
- elements/cross-compilers/aarch64-vars.yml
- elements/cross-compilers/gcc-common.yml
- elements/bootstrap/include/gcc-source.yml
