# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: flatpak_image

(@):
- elements/extensions/mesa/config.yml

build-depends:
- extensions/mesa/mesa.bst
- extensions/mesa/mesa-metainfo.bst

config:
  directory: "%{prefix}"
  exclude:
    - debug
    - docs
    - locale
    - devel
    - tests
    - shells

  metadata:
    Runtime:
      name: org.freedesktop.Platform.GL.default
      runtime: org.freedesktop.Platform/%{flatpak_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{flatpak_arch}/%{branch}

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{flatpak_arch}/%{branch}
