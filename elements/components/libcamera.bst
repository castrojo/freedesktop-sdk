# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-cmake.bst
- public-stacks/buildsystem-meson.bst

depends:
- components/glib.bst
- components/gstreamer-plugins-base.bst
- components/gstreamer.bst
- components/libevent.bst
- components/libyaml.bst
- components/python3-jinja2.bst
- components/python3-ply.bst
- components/python3-pyyaml.bst
- components/systemd-libs.bst

variables:
  pipelines: 'auto'
  arch-conf: ''
  (?):
  - target_arch == "aarch64":
      pipelines: 'uvcvideo,simple,virtual,imx8-isi,mali-c55,rkisp1,rpi/vc4'
      arch-conf: -Drpi-awb-nn=disabled

  meson-local: >-
    -Dgstreamer=enabled
    -Dpipelines=%{pipelines}
    -Dudev=enabled
    -Dv4l2=true
    -Dtracing=disabled
    -Dtest=false
    -Dlc-compliance=disabled
    -Dqcam=disabled
    -Ddocumentation=disabled
    -Dpycamera=disabled
    -Dcam-output-sdl2=disabled
    %{arch-conf}

config:
  install-commands:
    (>):
    - |
      rm -f "%{install-root}%{prefix}/lib/libyuv.a"

sources:
- kind: git_repo
  url: git_https:git.libcamera.org/libcamera/libcamera.git
  track: v*.*
  ref: v0.8.0-0-gdf8e348d64b4932a0676256ed24f0da3ee9438bc
- kind: patch
  path: patches/libcamera/disable-ipa-sign.patch
- kind: git_module
  path: subprojects/libyuv
  url: chromium:libyuv/libyuv.git
  ref: 500f45652c459cfccd20f83f297eb66cb7b015cb
