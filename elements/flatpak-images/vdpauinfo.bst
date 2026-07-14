# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: flatpak_image

(@):
- elements/extensions/include/app.yml

build-depends:
- extensions/vdpauinfo/appdata.bst
- extensions/vdpauinfo/vdpauinfo.bst

config:
  directory: '%{prefix}'
  exclude:
  - debug
  - devel
  - tests
  - shells

  metadata:
    Application:
      name: org.freedesktop.Platform.VdpauInfo
      runtime: org.freedesktop.Platform/%{flatpak_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{flatpak_arch}/%{branch}
      command: vdpauinfo

    Context:
      shared: ipc;
      sockets: x11;wayland;
      devices: dri;

    Extension org.freedesktop.Platform.VdpauInfo.Debug:
      directory: lib/debug
      autodelete: 'true'
      no-autodownload: 'true'
