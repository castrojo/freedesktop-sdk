kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/cmake.bst

depends:
- components/abseil-cpp.bst
- public-stacks/runtime-minimal.bst

variables:
  arch-conf: ''
  (?):
  - target_arch == "i686":
      arch-conf: -Dc_args="${CFLAGS} -DPFFFT_SIMD_DISABLE" -Dcpp_args="${CPPFLAGS}
        -DPFFFT_SIMD_DISABLE"
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
  ref: v2.1-0-g846fe90a289f58b7c9303a635142aa2c7caa93e5
