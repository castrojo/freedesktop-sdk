# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script

build-depends:
- integration/platform-integration.bst
- platform-image.bst

config:
  commands:
  - '%{libexecdir}/freedesktop-post.sh'
