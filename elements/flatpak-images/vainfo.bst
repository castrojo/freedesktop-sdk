kind: flatpak_image

variables:
  lib: lib
  prefix: /app

config:
  directory: '%{prefix}'
  exclude:
  - debug
  - devel
  - tests
  - shells

  metadata:
    Application:
      name: org.freedesktop.Platform.VaInfo
      runtime: org.freedesktop.Platform/%{flatpak_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{flatpak_arch}/%{branch}
      command: vainfo

    Context:
      shared: "ipc;"
      sockets: "x11;wayland;"
      devices: "dri;"

    Extension org.freedesktop.Platform.VaInfo.Debug:
      directory: lib/debug
      autodelete: 'true'
      no-autodownload: 'true'

build-depends:
- extensions/vainfo/libva-utils.bst
- extensions/vainfo/appdata.bst
