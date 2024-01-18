kind: meson

depends:
- components/libcap.bst
- components/systemd.bst

build-depends:
- public-stacks/buildsystem-meson.bst

sources:
- kind: git_tag
  url: github:iputils/iputils.git
  track: master
  ref: 20240117-0-g8372f355bdf7a9b0c79338dd8ef8464c00a5c4e2

variables:
  meson-local: >-
    -DBUILD_MANS=false
    -DSKIP_TESTS=true
