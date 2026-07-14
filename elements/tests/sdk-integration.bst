# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script

build-depends:
- integration/sdk-integration.bst
- sdk-image.bst

config:
  commands:
  - '%{libexecdir}/freedesktop-post.sh'
