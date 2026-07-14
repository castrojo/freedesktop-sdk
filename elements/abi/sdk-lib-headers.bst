# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

description: Extract the library headers from the Sdk.

build-depends:
- sdk-image.bst

config:
  include:
  - headers
