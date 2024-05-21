kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/systemd.bst
- components/flex.bst

depends:
- components/polkit-gobject.bst
- components/systemd-libs.bst

variables:
  conf-local: >-
    LEXLIB=""

sources:
- kind: git_repo
  url: debian_salsa:rousseau/PCSC.git
  track: '*.*.*'
  ref: 2.2.2-0-g0c07a1cb3cb1123d5d70d441bc774a634a2c31c8
