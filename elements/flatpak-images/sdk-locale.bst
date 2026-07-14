# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: flatpak_image

build-depends:
- sdk-image.bst

config:
  directory: '%{datadir}/runtime/locale'
  exclude:
  - debug
  - docs
  - tests
  - shells

  metadata:
    Runtime:
      name: org.freedesktop.Sdk.Locale

    ExtensionOf:
      ref: runtime/org.freedesktop.Sdk/%{flatpak_arch}/%{branch}
