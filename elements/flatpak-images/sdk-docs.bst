# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: flatpak_image

config:
  directory: '%{datadir}/runtime/docs'
  exclude:
  - debug
  - locale
  - tests
  - shells

  metadata:
    Runtime:
      name: org.freedesktop.Sdk.Docs

    ExtensionOf:
      ref: runtime/org.freedesktop.Sdk/%{flatpak_arch}/%{branch}

build-depends:
- sdk-image.bst
