# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: flatpak_image

(@):
- elements/extensions/codecs-extra/config.yml

build-depends:
- extensions/codecs-extra/appdata.bst
- extensions/codecs-extra/ffmpeg.bst
- extensions/codecs-extra/gstreamer-plugins-ugly-x264.bst
- extensions/codecs-extra/libheif.bst

config:
  directory: '%{prefix}'
  exclude:
  - debug
  - devel
  - tests
  - shells
  metadata:
    Runtime:
      name: org.freedesktop.Platform.codecs-extra

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{gcc_arch}/%{branch}
