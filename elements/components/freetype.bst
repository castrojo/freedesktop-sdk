kind: meson-recc

(@):
- elements/include/freetype.yml

build-depends:
- public-stacks/buildsystem-meson.bst
- components/_private/freetype-stage1.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst
- components/brotli.bst
- components/libpng.bst
- components/harfbuzz.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libfreetype.so'

  cpe:
    product: 'freetype2'
    vendor: 'freetype'

variables:
  meson-local: >-
    -Dbrotli=enabled
    -Dbzip2=enabled
    -Dharfbuzz=enabled
    -Dpng=enabled
    -Dzlib=enabled
