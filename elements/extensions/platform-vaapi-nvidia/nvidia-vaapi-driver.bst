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
  ref: v0.0.15-0-g2e204c67d4401292905f6afb4832a7e7df9ce53a
- kind: patch
  path: patches/platform-vaapi-nvidia/driverdir.patch
