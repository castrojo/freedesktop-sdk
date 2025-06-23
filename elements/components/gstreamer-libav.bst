kind: meson

(@):
- elements/include/gstreamer-source.yml
- include/_private/meson-recc.yml

build-depends:
- public-stacks/buildsystem-meson.bst
- components/ffmpeg.bst
- components/grep.bst
- components/hotdoc.bst
- components/nasm.bst
- (@): include/_private/gcc-for-recc.yml

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
