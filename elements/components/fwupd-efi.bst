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
  ref: 1.6-0-g58a2928f778278ab1f7f8fcddbab81ba587a8962
