# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: flatpak_image

(@):
- elements/extensions/include/app.yml

build-depends:
- extensions/glxinfo/appdata.bst
- extensions/glxinfo/mesa-demos.bst

config:
  directory: '%{prefix}'
  exclude:
  - debug
  - devel
  - tests
  - shells

  metadata:
    Application:
      name: org.freedesktop.Platform.GlxInfo
      runtime: org.freedesktop.Platform/%{flatpak_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{flatpak_arch}/%{branch}
      command: glxinfo

    Context:
      shared: ipc;
      sockets: x11;wayland;
      devices: dri;

    Extension org.freedesktop.Platform.GlxInfo.Debug:
      directory: lib/debug
      autodelete: 'true'
      no-autodownload: 'true'
