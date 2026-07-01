# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

build-depends:
- public-stacks/buildsystem-make.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  make-args: >-
    PREFIX="%{prefix}"
    BINDIR="%{prefix}/bin"
    MANDIR="%{mandir}"
    PCDIR="%{datadir}/pkgconfig"
    LDFLAGS="${LDFLAGS}"

sources:
- kind: git_repo
  track: '*.*.*'
  url: sourcehut:sircmpwn/scdoc
  ref: 1.11.4-0-g70de0e5e5d3bc40134ee65c35f1631656199f4be
