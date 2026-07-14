# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- bootstrap/grep.bst
- components/_private/gnu-efi.bst
- components/genpeimg.bst

variables:
  meson-local: >-
    -Defi_sbat_distro_id="freedesktop-sdk"
    -Defi_sbat_distro_summary="Freedesktop SDK"
    -Defi_sbat_distro_url="https://freedesktop-sdk.io/"

sources:
- kind: git_repo
  url: github:fwupd/fwupd-efi.git
  track: '*.*'
  ref: 1.8-0-g8572a93e81e7110b88445d1907fdd73982557347
