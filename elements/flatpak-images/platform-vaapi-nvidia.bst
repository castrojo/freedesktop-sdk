# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: flatpak_image

build-depends:
- extensions/platform-vaapi-nvidia/nvidia-vaapi-driver.bst
- extensions/platform-vaapi-nvidia/appdata.bst

config:
  directory: '%{libdir}/dri/nvidia-vaapi-driver'

  metadata:
    Runtime:
      name: org.freedesktop.Platform.VAAPI.nvidia
      runtime: org.freedesktop.Platform/%{flatpak_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{flatpak_arch}/%{branch}

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{flatpak_arch}/%{branch}
