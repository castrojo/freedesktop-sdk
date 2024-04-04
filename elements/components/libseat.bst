kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- components/systemd-libs.bst

variables:
  meson-local: >-
    -Dlibseat-logind=systemd
    -Dlibseat-seatd=disabled
    -Dlibseat-builtin=disabled
    -Dserver=disabled
    -Dexamples=disabled
    -Dman-pages=enabled

sources:
- kind: git_tag
  url: kennylevinsen:seatd
  track: master
  ref: 0.8.0-0-g3e9ef69f14f630a719dd464f3c90a7932f1c8296
