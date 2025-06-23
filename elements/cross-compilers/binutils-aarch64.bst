kind: autotools

(@):
- elements/cross-compilers/aarch64-vars.yml
- elements/bootstrap/include/binutils-source.yml
- elements/cross-compilers/binutils-common.yml
- include/_private/autotools-recc.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/flex.bst
- components/texinfo.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- components/zstd.bst
