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
  meson-local: >-
    -Ddriverdir="%{libdir}/dri/intel-vaapi-driver"

sources:
- kind: git_repo
  url: github:intel/intel-vaapi-driver.git
  track: '*.*.*'
  ref: 2.4.1-0-g9a1f0c64174f970a26380d4957583c71372fbb7c
