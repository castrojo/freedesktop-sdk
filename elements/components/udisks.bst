kind: autotools_recc

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/docbook-xsl.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

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
  ref: udisks-2.11.1-0-g6375ff14d3fed5f20c66ff50cfc02844473294a1
