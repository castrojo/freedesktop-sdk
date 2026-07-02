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
  ref: 2.5.1-0-gfd8ab89c20093f1bfba8fa9e302ba584fffd0fd7
