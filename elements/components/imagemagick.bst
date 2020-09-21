kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/jpeg.bst
- components/lcms.bst
- components/libpng.bst
- components/librsvg.bst
- components/libtiff.bst
- components/pango.bst
- components/zstd.bst

variables:
  conf-local: >-
    --enable-hdri
    --with-modules
    --without-perl
    --with-bzlib
    --with-fftw
    --with-jpeg
    --with-lcms
    --with-pango
    --with-png
    --with-rsvg
    --with-tiff
    --with-zlib
    --with-zstd

  # FIXME: split ghostscript libraries to enable gslib
  # FIXME: build and split perl modules

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libMagick++-*.*.so'
        - '%{libdir}/libMagickCore-*.*.so'
        - '%{libdir}/libMagickWand-*.*.so'

sources:
- kind: git_tag
  url: github:ImageMagick/ImageMagick.git
  track: master
  ref: 7.0.10-30-0-g316323c99af3f296f5316ca02ad0f2033aa151b3
