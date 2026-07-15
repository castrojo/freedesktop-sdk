# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: compose

description: Composes the platform image with the library headers, to check its ABI.

build-depends:
- abi/sdk-lib-headers.bst
- platform-image.bst

config:
  exclude:
  - docs
  - locale
  - source
  include-orphans: True
