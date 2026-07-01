# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

build-depends:
- public-stacks/buildsystem-make.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  make-args: >-
    BINDIR='%{bindir}'
    SBINDIR='%{bindir}'
    SHAREDIR='%{datadir}'
    MANDIR='%{mandir}'
    INCLUDEDIR='%{includedir}'
    ETCDIR='%{sysconfdir}'
    LIBDIR='%{libdir}'
    NO_ARLIB=1
    CFLAGS="${CFLAGS}"
    CXXFLAGS="${CXXFLAGS}"

  local_flags: >-
    -DPKGBUILD=\"$(date -u +%F -d @$SOURCE_DATE_EPOCH)\"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libkeyutils.so'

sources:
- kind: git_repo
  url: kernel:linux/kernel/git/dhowells/keyutils.git
  track: v*
  ref: v1.6.3-0-gcb3bb194cca88211cbfcdde2f10c0f43c3fb8ec3
