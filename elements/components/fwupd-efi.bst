kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/genpeimg.bst
- components/gnu-efi.bst

variables:
  meson-local: >-
    -Defi_sbat_distro_id="freedesktop-sdk"
    -Defi_sbat_distro_summary="Freedesktop SDK"
    -Defi_sbat_distro_url="https://freedesktop-sdk.io/"

sources:
- kind: git_repo
  url: github:fwupd/fwupd-efi.git
  track: '*.*'
  ref: 1.7-0-gcfd0be286a9b050c1aa4bfa3f0820256903a264a
