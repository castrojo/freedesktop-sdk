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
  ref: udisks-2.10.1-0-g18c9faf089e306ad6f3f51f5cb887a6b9aa08350

