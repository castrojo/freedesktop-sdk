kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- bootstrap/grep.bst
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
  ref: 1.9-0-gffeaa10aed8e91f5b8feaefc51faf71b3d034fd3
