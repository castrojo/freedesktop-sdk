kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/docbook-xsl.bst
- components/flex.bst

depends:
- bootstrap-import.bst
- components/libxslt.bst
- components/util-linux.bst

config:
  configure-commands:
    (<):
    - rm xmlif/xmlif.c

sources:
- kind: git_repo
  url: pagure:xmlto.git
  track: '*.*.*'
  ref: 0.0.29-0-g635dcd5bc84a7b67a3a2050a179d96e1d3050b15
