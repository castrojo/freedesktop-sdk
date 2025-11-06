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
  exclude:
  - "udisks-2.10.90"
  - "udisks-2.10.91"
  ref: udisks-2.11.0-0-gf4d454560e82361ca4e2245f6373b5d2f7567b46
