# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: compose
description: |
  Additional elements missing from fdsdk's Flatpak platform image whose
  ABI we want to verify. This is generally for elements from fdsdk, that
  are shipped by downstreams in their Flatpak runtime, but they are
  outside of fdsdk's ABI check.

  If an element is being removed from platform.bst but downstreams
  ship it in their Flatpak runtime, it should be included here so that
  we can verify its ABI.

  If downstreams start shipping an element outside of fdsdk's Flatpak
  platform they should also include it here.

  The libraries in these elements to check MUST be added to
  tests/check-abi/check-abi-extra-libs.yaml.

build-depends:
# Shipped by org.gnome.Platform
- components/appstream.bst
- components/libapparmor.bst

config:
  exclude:
  - doc
  - extra
  - static-allowlist
  - vm-only
  - tests
  - shells
  - license
  - locale
  - zoneinfo
  include-orphans: True
