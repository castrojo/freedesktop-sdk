kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/docbook-xsl.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst

depends:
- components/libatasmart.bst
- components/libblockdev.bst
- components/libgudev.bst
- components/polkit.bst

variables:
  # XML files generated to wrong directory
  build-dir: ''

sources:
- kind: git_tag
  url: github:storaged-project/udisks.git
  track: master
  ref: udisks-2.9.2-0-gda6d9480fefeb0ffdf8a84626b5096827d8d7030
