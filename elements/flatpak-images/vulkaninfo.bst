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
      name: org.freedesktop.Platform.VulkanInfo
      runtime: org.freedesktop.Platform/%{flatpak_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{flatpak_arch}/%{branch}
      command: vulkaninfo

    Context:
      shared: "ipc;"
      sockets: "x11;wayland;"
      devices: "dri;"

build-depends:
- extensions/vulkaninfo/vulkan-tools.bst
- extensions/vulkaninfo/appdata.bst
