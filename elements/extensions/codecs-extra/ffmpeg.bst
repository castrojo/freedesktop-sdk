kind: make
description: ffmpeg shipped in the codecs-extra extension, has more codecs enabled

(@):
- elements/include/ffmpeg.yml
- elements/extensions/codecs-extra/config.yml

depends:
  (>):
  - extensions/codecs-extra/libx264.bst
  - extensions/codecs-extra/libx265.bst

environment:
  PKG_CONFIG_PATH: "%{libdir}/pkgconfig"

variables:
  conf-extra: >-
    --enable-encoders
    --enable-decoders
    --disable-programs
    --enable-libx264
    --enable-libx265
    --enable-gpl
    --extra-cflags="-I%{prefix}/include"
    --extra-ldflags="-L%{libdir}"
