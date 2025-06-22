kind: autotools

(@):
- elements/cross-compilers/i686-vars.yml
- elements/bootstrap/include/binutils-source.yml
- elements/cross-compilers/binutils-common.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/flex.bst
- components/texinfo.bst

depends:
- components/zstd.bst
