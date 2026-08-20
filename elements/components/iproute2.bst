# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

build-depends:
- public-stacks/buildsystem-make.bst
- components/bison.bst
- components/flex.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  make-args: >-
    PREFIX="%{prefix}"
    LIBDIR="%{libdir}"
    SBINDIR="%{sbindir}"
    DATADIR="%{datadir}"
    MANDIR="%{mandir}"
    CONF_COLOR=COLOR_OPT_AUTO

sources:
- kind: git_repo
  url: kernel:network/iproute2/iproute2.git
  track: v*
  ref: v7.2.0-0-g880505966c17d90243c39e446d79da6236fb06ba
