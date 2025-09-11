kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/nv-codec-headers.bst
- components/libva.bst

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
  ref: v0.0.14-0-geffa3af05da4525d850a525ae2dedf5eb80351d7
- kind: patch
  path: patches/platform-vaapi-nvidia/driverdir.patch
