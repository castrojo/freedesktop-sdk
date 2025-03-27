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

sources:
- kind: git_repo
  url: debian_salsa:rousseau/PCSC.git
  track: '*.*.*'
  ref: 2.3.2-0-g38b1240e19594d52699259cf066d3f1c1422d054
