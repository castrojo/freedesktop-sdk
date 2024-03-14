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

  cpe:
    patches:
    - CVE-2023-4863
    - CVE-2023-1999

sources:
- kind: git_tag
  url: chromium:webm/libwebp.git
  ref: v1.2.4-0-g0d1f12546bd803099a60c070517a552483f3790e
- kind: patch_queue
  path: patches/libwebp
