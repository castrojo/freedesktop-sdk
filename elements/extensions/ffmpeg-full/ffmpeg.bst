kind: make
description: ffmpeg shipped in the ffmpeg-full extension, has more codecs enabled

(@):
- elements/include/ffmpeg.yml
- elements/extensions/ffmpeg-full/config.yml

variables:
  conf-extra: >-
    --enable-encoders
    --enable-decoders
    --disable-programs
