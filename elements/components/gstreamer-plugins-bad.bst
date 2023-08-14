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
    -Dvdpau=disabled
    -Dvulkan=enabled
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
        - '%{libdir}/libgstinsertbin-1.0.so'
        - '%{libdir}/libgstisoff-1.0.so'
        - '%{libdir}/libgstmpegts-1.0.so'
        - '%{libdir}/libgstphotography-1.0.so'
        - '%{libdir}/libgstplayer-1.0.so'
        - '%{libdir}/libgstsctp-1.0.so'
        - '%{libdir}/libgsttranscoder-1.0.so'
        - '%{libdir}/libgsturidownloader-1.0.so'
        - '%{libdir}/libgstvulkan-1.0.so'
        - '%{libdir}/libgstwayland-1.0.so'
        - '%{libdir}/libgstwebrtc-1.0.so'
  cpe:
    product: gst-plugins-bad

sources:
- kind: git_tag
  url: freedesktop:gstreamer/gst-plugins-bad.git
  track: master
  track-extra:
  - '1.18'
  match:
  - 1.*[02468].*
  ref: 1.18.5-0-gd3af58d5b31941caa26c3ded85d7a7b84a91f0cc
  submodules:
    common:
      checkout: false
      url: freedesktop:gstreamer/common.git
- kind: patch
  path: patches/gstreamer-plugins-bad/gst-plugins-bad-Optional-LRDF-dep-for-ladspa.patch
- kind: patch
  path: patches/gstreamer-plugins-bad/graceful-error-noopenh264.patch
- kind: patch
  path: patches/gstreamer-plugins-bad/gst-plugins-bad-h264parse-VideoTimeCodeMeta.patch
