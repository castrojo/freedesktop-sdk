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
  ref: 0.9.1-0-g566ffeb032af42865dc1210e48cec08368059bb9
