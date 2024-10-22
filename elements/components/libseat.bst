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
- kind: git_repo
  url: sourcehut:kennylevinsen/seatd
  track: '*.*.*'
  ref: 0.9.0-0-g5d2b3e95d82490dd6c1013752996c1ed43247820
