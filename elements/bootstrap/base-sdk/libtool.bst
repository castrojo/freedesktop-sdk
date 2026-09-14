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
    version: 2.5.4
    sha256sum: f81f5860666b0bc7d84baddefa60d1cb9fa6fceb2398cc3baca6afaa60266675
