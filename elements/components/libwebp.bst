kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libpng.bst
- components/jpeg.bst
- components/giflib.bst

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
  ref: v1.5.0-0-ga4d7a715337ded4451fec90ff8ce79728e04126c
