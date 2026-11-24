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
    version: 2.7.8
    sha256sum: 88d80ba91c8f89251cdbef92b4cac598e87ee782a9467eff47715aeac92d6d86
- kind: patch
  path: patches/flex/flex-pie.patch
