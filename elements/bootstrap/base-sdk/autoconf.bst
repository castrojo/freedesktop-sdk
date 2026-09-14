# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: GNU autoconf

(@):
- elements/bootstrap/include/base-sdk.yml

build-depends:
- bootstrap/gnu-config.bst

depends:
- bootstrap/base-sdk/m4.bst
- bootstrap/base-sdk/perl.bst

sources:
- kind: anitya
  project-id: 141
  url: ftp_gnu_org:autoconf/autoconf-{version}.tar.xz
  ref:
    version: 2.73
    sha256sum: 9fd672b1c8425fac2fa67fa0477b990987268b90ff36d5f016dae57be0d6b52e
