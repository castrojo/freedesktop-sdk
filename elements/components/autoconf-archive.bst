# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: GNU autoconf archive

build-depends:
- public-stacks/buildsystem-make.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: anitya
  project-id: 142
  url: ftp_gnu_org:autoconf-archive/autoconf-archive-{version}.tar.xz
  ref:
    version: 2026.11.11
    sha256sum: 2c18f15e2b3bb79e09622b27391df07d8608ce9f07fbfc7c1143fa683891ab26
