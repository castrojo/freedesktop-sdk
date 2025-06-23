kind: autotools

(@):
- elements/cross-compilers/loongarch64-vars.yml
- elements/cross-compilers/gcc-common.yml
- elements/include/gcc-source.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/autoconf2.69.bst
- components/flex.bst
- components/tar.bst
- components/texinfo.bst
- cross-compilers/standard-libs-loongarch64.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- cross-compilers/binutils-loongarch64.bst

variables:
  conf-arch: ''
