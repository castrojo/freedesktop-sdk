# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script

build-depends:
- platform-image.bst
- integration/platform-integration.bst

config:
  commands:
  - '%{libexecdir}/freedesktop-post.sh'
