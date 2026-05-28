kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/systemd.bst
- components/flex.bst
- components/perl.bst

depends:
- components/polkit-gobject.bst
- components/systemd-libs.bst

variables:
  meson-local: >-
    -Dsystemdunit="system"

config:
  install-commands:
    (>):
    - find "%{install-root}" -name "lib*.a" -delete

sources:
- kind: git_repo
  url: github:LudovicRousseau/PCSC.git
  track: '*.*.*'
  ref: 2.5.0-0-gd353daed40ede5805caf44176057feb7b7cab90f
