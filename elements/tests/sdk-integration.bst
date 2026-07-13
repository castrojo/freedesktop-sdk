# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script

build-depends:
- sdk-image.bst
- integration/sdk-integration.bst

config:
  commands:
  - '%{libexecdir}/freedesktop-post.sh'
