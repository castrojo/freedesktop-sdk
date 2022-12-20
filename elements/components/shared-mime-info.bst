kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/docbook-xsl.bst
- components/xmlto.bst

depends:
- components/libxml2.bst
- components/glib.bst

public:
  bst:
    integration-commands:
    - PKGSYSTEM_ENABLE_FSYNC=0 update-mime-database "%{datadir}/mime"

sources:
- kind: git_repo
  url: freedesktop:xdg/shared-mime-info.git
  track: '*.*'
  ref: 2.2-0-g13695c7225c2f525a435e72739c33ac32bbfbbb9
