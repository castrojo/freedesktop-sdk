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
  ref: 0.9.2-0-ga3c56c324c3a84474cc1615d94ccd6a6255d0c10
