kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/python3-gi-docgen.bst
- components/gobject-introspection.bst
- components/docbook-xsl.bst
- components/libxslt.bst

depends:
- bootstrap-import.bst
- components/glib.bst
- components/libgcrypt.bst

variables:
  meson-local: >-
    -Dvapi=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/secret-tool'
        - '%{libdir}/libsecret-1.so'

sources:
- kind: git_repo
  url: gnome:libsecret.git
  track: '*.*.*'
  ref: 0.21.4-0-g6b5a6c28afc6dd93c232a4907a87c881079ff91b
