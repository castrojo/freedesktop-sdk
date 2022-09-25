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
  ref: 1.9.9-0-g15c16c7796607b1c8a2ce253d3f536918ab26b4a
