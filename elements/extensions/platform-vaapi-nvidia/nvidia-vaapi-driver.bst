kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/nv-codec-headers.bst
- components/libva.bst

depends:
- components/gstreamer-plugins-bad.bst
- components/libglvnd.bst

variables:
  meson-local: >-
    -Ddriverdir="%{libdir}/dri/nvidia-vaapi-driver"

sources:
- kind: git_repo
  url: github:elFarto/nvidia-vaapi-driver.git
  track: v*
  ref: v0.0.13-0-g68efa33131745f1b2d530c64f6692f3993f3d53c
- kind: patch
  path: patches/platform-vaapi-nvidia/driverdir.patch
