# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/libva.bst
- components/nv-codec-headers.bst

depends:
- components/gstreamer-plugins-bad.bst
- components/libglvnd.bst

variables:
  licensedir: "%{libdir}/dri/nvidia-vaapi-driver/share/licenses"
  meson-local: >-
    -Ddriverdir="%{libdir}/dri/nvidia-vaapi-driver"

sources:
- kind: git_repo
  url: github:elFarto/nvidia-vaapi-driver.git
  track: v*
  ref: v0.0.18-0-g982ba1c2464b9cea5a4403df8f2c5a351ca21394
- kind: patch
  path: patches/platform-vaapi-nvidia/driverdir.patch
