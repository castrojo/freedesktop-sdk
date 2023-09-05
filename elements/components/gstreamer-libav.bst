kind: meson

build-depends:
- components/ffmpeg.bst
- public-stacks/buildsystem-meson.bst
- components/nasm.bst
- components/hotdoc.bst

depends:
- public-stacks/runtime-minimal.bst
- components/orc.bst
- components/gstreamer.bst
- components/gstreamer-plugins-base.bst

variables:
  command-subdir: subprojects/gst-libav
  local_flags: -DTRIPLET='"%{gcc_triplet}"'

(@):
- elements/include/gstreamer-source.yml

