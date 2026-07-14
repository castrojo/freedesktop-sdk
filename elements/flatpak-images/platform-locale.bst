# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: flatpak_image

build-depends:
- platform-image.bst

config:
  directory: '%{datadir}/runtime/locale'
  exclude:
  - debug
  - docs
  - tests
  - shells

  metadata:
    Runtime:
      name: org.freedesktop.Platform.Locale

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{flatpak_arch}/%{branch}
