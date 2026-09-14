# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: GNU automake

(@):
- elements/bootstrap/include/base-sdk.yml

build-depends:
- bootstrap/gnu-config.bst

depends:
- bootstrap/base-sdk/autoconf.bst

sources:
- kind: anitya
  project-id: 144
  url: ftp_gnu_org:automake/automake-{version}.tar.xz
  ref:
    version: 1.18.1
    sha256sum: 168aa363278351b89af56684448f525a5bce5079d0b6842bd910fdd3f1646887
