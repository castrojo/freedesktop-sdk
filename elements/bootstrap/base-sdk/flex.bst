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
    version: 2.7.9
    sha256sum: eda7d158abe845c49956554488a0749a637891124824a77ab16dadbe0ce58eb7
- kind: patch
  path: patches/flex/flex-pie.patch
