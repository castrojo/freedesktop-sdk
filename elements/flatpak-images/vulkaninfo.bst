# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: flatpak_image

(@):
- elements/extensions/include/app.yml

build-depends:
- extensions/vulkaninfo/appdata.bst
- extensions/vulkaninfo/vulkan-tools.bst

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
