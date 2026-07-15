# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: flatpak_image

(@):
- elements/extensions/include/app.yml

build-depends:
- extensions/clinfo/appdata.bst
- extensions/clinfo/clinfo.bst

config:
  directory: "%{prefix}"
  exclude:
  - debug
  - devel
  - tests
  - shells

  metadata:
    Application:
      name: org.freedesktop.Platform.ClInfo
      runtime: org.freedesktop.Platform/%{flatpak_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{flatpak_arch}/%{branch}
      command: clinfo

    Context:
      shared: "ipc;"
      sockets: "x11;wayland;"
      devices: "dri;"
