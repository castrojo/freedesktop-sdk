kind: meson

depends:
- bootstrap-import.bst
- components/aom.bst
- components/orc.bst
- components/frei0r.bst
- components/gstreamer.bst
- components/gstreamer-plugins-base.bst
- components/ladspa-sdk.bst
- components/libdrm.bst
- components/libfdk-aac.bst
- components/libglvnd.bst
- components/libnice.bst
- components/librsvg.bst
- components/libva.bst
- components/libgudev.bst
- components/openal.bst
- components/vulkan-icd-loader.bst
- components/wayland.bst
- components/curl.bst
- components/libwebp.bst
- components/sndfile.bst
- components/webrtc-audio-processing.bst
- components/noopenh264.bst
- components/libsrtp2.bst

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/wayland-protocols.bst
- components/shaderc.bst
- components/vulkan-headers.bst

variables:
  command-subdir: subprojects/gst-plugins-bad

  meson-local: >-
    -Dauto_features=auto
    -Daom=enabled
    -Dbz2=enabled
    -Dcurl=enabled
    -Dfdkaac=enabled
    -Dfrei0r=enabled
    -Dgl=enabled
    -Dhls=enabled
    -Dintrospection=enabled
    -Dladspa=enabled
    -Dopenal=enabled
    -Dopus=enabled
    -Dorc=enabled
    -Dpackage-origin="freedesktop-sdk"
    -Drsvg=enabled
    -Dsndfile=enabled
    -Dva=enabled
    -Dvulkan=enabled
    -Dv4l2codecs=enabled
    -Dwayland=enabled
    -Dwebp=enabled
    -Dopenh264=enabled
    -Dsrtp=enabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgstadaptivedemux-1.0.so'
        - '%{libdir}/libgstbadallocators-1.0.so'
        - '%{libdir}/libgstbadaudio-1.0.so'
        - '%{libdir}/libgstbadbase-1.0.so'
        - '%{libdir}/libgstbadvideo-1.0.so'
        - '%{libdir}/libgstbasecamerabinsrc-1.0.so'
        - '%{libdir}/libgstcodecparsers-1.0.so'
        - '%{libdir}/libgstcodecs-1.0.so'
        - '%{libdir}/libgstcuda-1.0.so'
        - '%{libdir}/libgstinsertbin-1.0.so'
        - '%{libdir}/libgstisoff-1.0.so'
        - '%{libdir}/libgstmpegts-1.0.so'
        - '%{libdir}/libgstphotography-1.0.so'
        - '%{libdir}/libgstplay-1.0.so'
        - '%{libdir}/libgstplayer-1.0.so'
        - '%{libdir}/libgstsctp-1.0.so'
        - '%{libdir}/libgsttranscoder-1.0.so'
        - '%{libdir}/libgsturidownloader-1.0.so'
        - '%{libdir}/libgstva-1.0.so'
        - '%{libdir}/libgstvulkan-1.0.so'
        - '%{libdir}/libgstv4l2codecs.so'
        - '%{libdir}/libgstwayland-1.0.so'
        - '%{libdir}/libgstwebrtc-1.0.so'
        - '%{libdir}/libgstwebrtcnice-1.0.so'
  cpe:
    product: gstreamer

(@):
- elements/include/gstreamer-source.yml
