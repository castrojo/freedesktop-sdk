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
    version: 2024.10.16
    sha256sum: 7bcd5d001916f3a50ed7436f4f700e3d2b1bade3ed803219c592d62502a57363
