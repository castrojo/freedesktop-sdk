kind: meson

build-depends:
- extensions/mesa/libdrm.bst
- public-stacks/buildsystem-meson.bst

depends:
- components/libdrm.bst
- components/libva.bst

environment:
  PKG_CONFIG_PATH: "/usr/lib/%{gcc_triplet}/GL/default/lib/pkgconfig:"

variables:
  licensedir: "%{libdir}/dri/intel-vaapi-driver/share/licenses"
  meson-local: >-
    -Ddriverdir="%{libdir}/dri/intel-vaapi-driver"

sources:
- kind: git_repo
  url: github:intel/intel-vaapi-driver.git
  track: '*.*.*'
  ref: 2.4.1-0-g9a1f0c64174f970a26380d4957583c71372fbb7c
- kind: patch
  path: patches/vaapi-intel/0001-Make-wl_drm-optional.patch
