kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/cmake.bst

depends:
- bootstrap-import.bst
- components/abseil-cpp.bst

variables:
  arch-conf: ''
  (?):
  - target_arch == "i686":
      arch-conf: -Dc_args="${CFLAGS} -DPFFFT_SIMD_DISABLE" -Dcpp_args="${CPPFLAGS} -DPFFFT_SIMD_DISABLE"
  meson-local: >-
    -Dcpp_std=c++17
    %{arch-conf}

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libwebrtc-audio-coding-1.so"
        - "%{libdir}/libwebrtc-audio-processing-1.so"

sources:
- kind: git_repo
  url: freedesktop:pulseaudio/webrtc-audio-processing.git
  track: v*
  ref: v1.3-0-g8e258a1933d405073c9e6465628a69ac7d2a1f13
- kind: patch
  path: patches/webrtc-audio-processing/Add-generic-byte-order-and-pointer-size-detection.patch
- kind: patch
  path: patches/webrtc-audio-processing/webrtc-audio-processing-1.3-big-endian-support.patch
- kind: patch
  path: patches/webrtc-audio-processing/webrtc-audio-processing-1.3-x86-no-sse.patch
