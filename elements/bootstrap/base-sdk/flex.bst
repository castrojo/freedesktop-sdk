# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

(@):
- elements/bootstrap/include/base-sdk.yml

build-depends:
- bootstrap/base-sdk/automake.bst
- bootstrap/base-sdk/libtool.bst
- bootstrap/gnu-config.bst

depends:
- bootstrap/base-sdk/m4.bst

environment:
  AUTOPOINT: true

variables:
  make-args: >-
    MAKEINFO=true

config:
  configure-commands:
    (<):
    - |
      ./autogen.sh

sources:
- kind: tar
  url: github_files:westes/flex/files/981163/flex-2.6.4.tar.gz
  ref: e87aae032bf07c26f85ac0ed3250998c37621d95f8bd748b31f15b33c45ee995
- kind: patch
  path: patches/flex/flex-pie.patch
