# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: flatpak_image

(@):
- elements/cross-compilers/i686-vars.yml

build-depends:
- cross-compilers/binutils-i686.bst
- cross-compilers/gcc-i686.bst

config:
  directory: '%{prefix}'
  exclude:
  - debug
  - docs
  - locale
  - tests
  - shells

  metadata:
    Runtime:
      name: org.freedesktop.Sdk.Extension.toolchain-%{cross_gcc_arch}
      runtime: org.freedesktop.Platform/%{flatpak_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{flatpak_arch}/%{branch}

    ExtensionOf:
      ref: runtime/org.freedesktop.Sdk/%{flatpak_arch}/%{branch}
