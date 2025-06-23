kind: meson-recc

build-depends:
- public-stacks/buildsystem-meson.bst
- components/libva.bst
- components/nv-codec-headers.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

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
  ref: v0.0.16-0-gb09c9f62fb6d8b839e0e87e6f0ce53b7dbf9b3c5
- kind: patch
  path: patches/platform-vaapi-nvidia/driverdir.patch
