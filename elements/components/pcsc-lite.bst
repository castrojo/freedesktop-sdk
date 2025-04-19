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
  ref: 2.3.3-0-g3ef55e02979de6834015b380c1d21671eeb4e9f5
