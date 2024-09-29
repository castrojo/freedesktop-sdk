kind: make
description: ffmpeg shipped in the ffmpeg-full extension, has more codecs enabled

(@):
- elements/include/ffmpeg.yml
- elements/extensions/ffmpeg-full/config.yml

depends:
  (>):
  - extensions/ffmpeg-full/libx264.bst
  - extensions/ffmpeg-full/libx265.bst

environment:
  PKG_CONFIG_PATH: "%{prefix}/pkgconfig"

variables:
  conf-extra: >-
    --enable-encoders
    --enable-decoders
    --disable-programs
    --enable-libx264
    --enable-libx265
    --enable-gpl
    --extra-cflags="-I%{prefix}/include"
    --extra-ldflags="-L%{prefix}"
