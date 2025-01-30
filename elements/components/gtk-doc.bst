kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/sed.bst

depends:
- public-stacks/runtime-minimal.bst
- components/itstool.bst
- components/docbook-xml.bst
- components/docbook-xsl.bst
- components/pkg-config.bst   # gtk-doc uses pkg-config during runtime.
- components/python3.bst
- components/python3-pygments.bst

variables:
  meson-local: >-
    -Dyelp_manual=false
    -Dtests=false

sources:
- kind: git_repo
  url: gnome:gtk-doc.git
  track: '*.*'
  ref: 1.34.0-0-gb7c8317bf023b5116250b4c5381737d5b9786976
