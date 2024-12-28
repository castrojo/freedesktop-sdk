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
  ref: 2.3.1-0-gbe1c2a6532444cfa4a65065fe0b527fbd53033e8
