# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: GNU libtool

(@):
- elements/bootstrap/include/base-sdk.yml

build-depends:
- bootstrap/base-sdk/m4.bst
- bootstrap/gnu-config.bst

depends:
- bootstrap/base-sdk/binary-seed.bst

sources:
- kind: anitya
  project-id: 1741
  url: ftp_gnu_org:libtool/libtool-{version}.tar.xz
  ref:
    version: 2.6.2
    sha256sum: 2ef1067c16c97db930fd740cc9bc3d3ba9a583804ae5ac42cc3e8719e49e191e
