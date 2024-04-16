kind: collect_manifest

build-depends:
  - flatpak-release.bst
  - oci/layers/flatpak.bst
  - oci/layers/debug.bst
  - oci/layers/platform.bst
  - oci/layers/sdk.bst

config:
  path: "/usr/manifest.json"
