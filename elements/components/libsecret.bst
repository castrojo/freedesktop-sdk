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
  ref: 0.21.4-18-gf41bb4e8f0dc61fa832f984c15c65f8f168ce442
