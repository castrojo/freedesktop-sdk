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
  url: debian_salsa:rousseau/PCSC.git
  track: '*.*.*'
  ref: 2.4.0-0-g4c8fce0c70a8c61c1a5db5566f9ffb20dacef347
