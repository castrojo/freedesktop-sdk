kind: autotools

build-depends:
- bootstrap-import.bst
- components/tar.bst
- cross-compilers/standard-libs-riscv64.bst
- public-stacks/buildsystem-autotools.bst
- components/texinfo.bst
- components/autoconf2.69.bst

depends:
- cross-compilers/binutils-aarch64.bst

(@):
- elements/bootstrap/include/gcc-source.yml
- elements/cross-compilers/riscv64-vars.yml
- elements/cross-compilers/gcc-common.yml

variables:
  conf-arch: ''
