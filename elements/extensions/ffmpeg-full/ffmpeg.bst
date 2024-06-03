kind: make
description: ffmpeg shipped in the ffmpeg-full extension, has more codecs enabled

(@):
- elements/include/ffmpeg.yml
- elements/extensions/ffmpeg-full/config.yml

depends:
  (>):
  - extensions/ffmpeg-full/libx265.bst

variables:
  conf-extra: >-
    --enable-encoders
    --enable-decoders
    --disable-programs
