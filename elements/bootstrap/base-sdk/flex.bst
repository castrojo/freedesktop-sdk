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
    version: 2.7.3
    sha256sum: b18bbc3622b2b9ebecd0423f4e110adfad8db51d0c5ada3f26660c7cb7c735ec
- kind: patch
  path: patches/flex/flex-pie.patch
