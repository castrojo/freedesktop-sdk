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
  ref: 2.3-0-g8e80a317f5c61a7f410330abea441e0b0b9280b5
