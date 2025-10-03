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

runtime-depends:
- components/python3-lxml.bst

variables:
  meson-local: >-
    -Dyelp_manual=false
    -Dtests=false

sources:
- kind: git_repo
  url: gnome:gtk-doc.git
  track: '*.*'
  ref: 1.35.1-0-g82623a6c120e153be9bee8642693a00bc1aae77f
