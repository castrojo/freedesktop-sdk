# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/cmake.bst

depends:
- components/abseil-cpp.bst
- public-stacks/runtime-minimal.bst

variables:
  arch-conf: ""
  (?):
  - target_arch != "aarch64":
      arch-conf: "-Dneon=disabled"
  meson-local: >-
    -Dcpp_std=c++20
    %{arch-conf}

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libwebrtc-audio-processing-2.so"

sources:
- kind: git_repo
  url: freedesktop:pulseaudio/webrtc-audio-processing.git
  track: v*
  ref: v2.1-0-g846fe90a289f58b7c9303a635142aa2c7caa93e5
- kind: patch
  path: patches/webrtc-audio-processing/gcc15.patch
- kind: patch
  path: patches/webrtc-audio-processing/0001-Fix-build-with-abseil-cpp-202508.patch
