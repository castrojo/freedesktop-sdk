kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/systemd.bst
- components/flex.bst

depends:
- components/systemd-libs.bst

variables:
  conf-local: >-
    LEXLIB=""

sources:
- kind: git_tag
  url: debian_salsa:rousseau/PCSC.git
  track: master
  ref: 2.0.0-0-g549922c1355fdd1e85eb0a952fefda7bb96e286a
