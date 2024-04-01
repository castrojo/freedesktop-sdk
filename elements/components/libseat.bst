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
  ref: 0.7.0-0-ga803ba0502cccf147eec7fbcacd11c5b8643c0e0
