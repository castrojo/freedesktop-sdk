kind: meson_recc

(@):
- elements/include/freetype.yml

build-depends:
- public-stacks/buildsystem-meson.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst
- components/brotli.bst
- components/libpng.bst

variables:
  meson-local: >-
    -Dbrotli=enabled
    -Dbzip2=enabled
    -Dharfbuzz=disabled
    -Dpng=enabled
    -Dzlib=enabled
