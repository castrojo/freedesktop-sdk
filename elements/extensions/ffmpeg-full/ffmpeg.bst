kind: make
description: ffmpeg shipped in the ffmpeg-full extension, has more codecs enabled

(@):
- elements/include/ffmpeg.yml
- elements/extensions/ffmpeg-full/config.yml

variables:
  extra-aud-enc: wmav1,wmav2
  extra-aud-dec: ape,dca,eac3,mlp,tak,truehd,wmav1,wmav2,wmapro
  extra-vid-enc: h263,h263p,h264,ljpeg,mpeg4,wmv1,wmv2
  extra-vid-dec: |
    cinepak,flv,hevc,h263,h264,indeo2,indeo3,indeo4,indeo5,jpeg2000,mpeg2video,\
    mpeg4,msmpeg4,msmpeg4v1,msmpeg4v2,msmpeg4v3,vp6,vp6a,vp6f,wmv1,wmv2,wmv3,wmv3image
  extra-hwaccels: h263_vaapi,h264_vaapi,h264_vdpau,hevc_vaapi,hevc_vdpau,mpeg4_vaapi,mpeg4_vdpau
  extra-parsers: hevc,h263,h264,dca
  extra-muxers: asf,avi,h263,h264,hevc,mp4
  extra-demuxers: ape,asf,avi,h263,h264,hevc,m4v,mjpeg_2000,mp4,wav,xwma

