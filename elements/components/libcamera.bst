# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- components/glib.bst
- components/gstreamer.bst
- components/gstreamer-plugins-base.bst
- components/libyaml.bst
- components/libevent.bst
- components/systemd-libs.bst
- components/python3-jinja2.bst
- components/python3-pyyaml.bst
- components/python3-ply.bst

variables:
  pipelines: uvcvideo%{arch-pipelines}
  arch-pipelines: ''
  arch-conf: ''
  (?):
  - target_arch == "i686" or target_arch == "x86_64":
      arch-pipelines: ',ipu3'
  - target_arch == "aarch64":
      arch-pipelines: ',imx8-isi,rkisp1,rpi/vc4,simple'
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

sources:
- kind: git_repo
  url: git_https:git.libcamera.org/libcamera/libcamera.git
  track: v*.*
  ref: v0.7.1-0-g183e37362f57ff3ce7493abf0bc6f1b57b931f55
- kind: patch
  path: patches/libcamera/disable-ipa-sign.patch
