# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: anitya
  project-id: 2028
  url: ftp_gnu_org:mtools/mtools-{version}.tar.bz2
  ref:
    version: 4.0.49
    sha256sum: 6fe5193583d6e7c59da75e63d7234f76c0b07caf33b103894f46f66a871ffc9f
