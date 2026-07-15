# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: flatpak_image

build-depends:
- extensions/platform-vaapi-intel/appdata.bst
- extensions/platform-vaapi-intel/intel-media-driver.bst

config:
  directory: '%{libdir}/dri/intel-vaapi-driver'

  metadata:
    Runtime:
      name: org.freedesktop.Platform.VAAPI.Intel
      runtime: org.freedesktop.Platform/%{flatpak_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{flatpak_arch}/%{branch}

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{flatpak_arch}/%{branch}
