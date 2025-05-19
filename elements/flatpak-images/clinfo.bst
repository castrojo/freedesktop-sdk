kind: flatpak_image

variables:
  prefix: /app

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

build-depends:
- extensions/clinfo/clinfo.bst
- extensions/clinfo/appdata.bst
