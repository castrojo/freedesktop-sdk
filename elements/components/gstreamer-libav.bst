kind: meson

(@):
- elements/include/gstreamer-source.yml

build-depends:
- components/ffmpeg.bst
- public-stacks/buildsystem-meson.bst
- components/nasm.bst
- components/hotdoc.bst
- components/grep.bst

depends:
- public-stacks/runtime-minimal.bst
- components/orc.bst
- components/gstreamer.bst
- components/gstreamer-plugins-base.bst

variables:
  command-subdir: subprojects/gst-libav
  local_flags: -DTRIPLET='"%{gcc_triplet}"'

config:
  install-commands:
    (>):
    - |
      set -eu
      libs="$(grep -Eo '"lib[^"]+\.so[^"]*"' %{build-root}/gst-libav-stop-caching-codecs.patch | sed 's/,\"$/\"/'|tr -d '"')"
      [ -z "$libs" ] && { echo "No libraries found from patch"; exit 1; }
      for lib in $libs; do
        if test -f "%{libdir}/$lib"; then
          echo "Found %{libdir}/$lib"
        else
          echo "Did not find %{libdir}/$lib"
          exit 1
        fi
      done
