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
  ref: v0.0.12-0-gfc5ce861fdbb9b4a67a702ba7d08e5b963584418
- kind: patch
  path: patches/platform-vaapi-nvidia/driverdir.patch
