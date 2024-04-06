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
- kind: git_repo
  url: github:storaged-project/udisks.git
  track: udisks-*
  ref: udisks-2.10.0-0-ga1a99ef84f96151f60f3254b767286ee26064846

