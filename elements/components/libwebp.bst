kind: autotools

depends:
- bootstrap-import.bst
- components/libpng.bst
- components/jpeg.bst
- components/giflib.bst

build-depends:
- public-stacks/buildsystem-autotools.bst

variables:
  conf-local: |
    --disable-wic \
    --enable-jpeg \
    --enable-png \
    --enable-gif \
    --enable-tiff \
    --enable-libwebpmux \
    --enable-libwebpdemux \
    --enable-libwebpdecoder \
    --enable-threading

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libwebpdecoder.so'
        - '%{libdir}/libwebpdemux.so'
        - '%{libdir}/libwebpmux.so'
        - '%{libdir}/libwebp.so'
        - '%{libdir}/libsharpyuv.so'

sources:
- kind: git_repo
  url: chromium:webm/libwebp.git
  track: v*
  exclude:
  - '*-rc*'
  ref: v1.4.0-0-g845d5476a866141ba35ac133f856fa62f0b7445f
