kind: autotools

build-depends:
- bootstrap-import.bst
- components/tar.bst
- cross-compilers/standard-libs-riscv64.bst
- public-stacks/buildsystem-autotools.bst
- components/texinfo.bst
- components/autoconf2.69.bst
- components/flex.bst

depends:
- cross-compilers/binutils-riscv64.bst

(@):
- elements/cross-compilers/riscv64-vars.yml
- elements/cross-compilers/gcc-common.yml
- elements/include/gcc-source.yml

variables:
  conf-arch: ''
