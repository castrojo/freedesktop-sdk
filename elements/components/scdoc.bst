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
  ref: 1.11.5-0-g24be30ef17d5ca0162f11b35258c8fa2413d556a
