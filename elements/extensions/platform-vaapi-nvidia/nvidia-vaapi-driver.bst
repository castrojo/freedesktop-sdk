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
  ref: v0.0.17-0-g0ba758d54591bf90133f63ca8b29796d51ec1761
- kind: patch
  path: patches/platform-vaapi-nvidia/driverdir.patch
