kind: autotools

build-depends:
- bootstrap-import.bst
- components/bison.bst
- components/flex.bst
- components/pkg-config.bst
- components/texinfo.bst

depends:
- components/zstd.bst

(@):
- elements/cross-compilers/i686-vars.yml
- elements/bootstrap/include/binutils-source.yml
- elements/cross-compilers/binutils-common.yml
