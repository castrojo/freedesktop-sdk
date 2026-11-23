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
  AUTOPOINT: True

variables:
  make-args: >-
    MAKEINFO=true

config:
  configure-commands:
    (<):
    - |
      ./autogen.sh

sources:
- kind: anitya
  project-id: 819
  url: github_files:westes/flex/releases/download/v{version}/flex-{version}.tar.gz
  ref:
    version: 2.7.5
    sha256sum: 59996449110b7a63544d8e9b84ac49ec6fb442a1595110bf7cc747720b927733
- kind: patch
  path: patches/flex/flex-pie.patch
