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
- kind: git_tag
  url: chromium:webm/libwebp.git
  track: main
  ref: v1.3.0-0-gb557776962a3dcc985d83bd4ed94e1e2e50d0fa2
