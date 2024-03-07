kind: autotools

build-depends:
- bootstrap-import.bst
- components/tar.bst
- cross-compilers/standard-libs-aarch64.bst
- public-stacks/buildsystem-autotools.bst
- components/texinfo.bst
- components/autoconf2.69.bst
- components/flex.bst

depends:
- cross-compilers/binutils-aarch64.bst

(@):
- elements/cross-compilers/aarch64-vars.yml
- elements/cross-compilers/gcc-common.yml
- elements/include/gcc-source.yml

variables:
  conf-arch: ''
