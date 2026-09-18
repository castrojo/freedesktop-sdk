# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/icu.bst
- components/inih.bst
- components/liburcu.bst
- components/util-linux-libs.bst

variables:
  # This build system does not generate required files under build-dir
  build-dir: ''
  autogen: make configure
  make-args: >-
    PKG_ROOT_SBIN_DIR='%{sbindir}'
    PKG_ROOT_LIB_DIR='%{libdir}'
    PKG_LIB_DIR='%{libdir}'
  make-install: make -j1 %{make-install-args} install-dev

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libhandle.so'

sources:
- kind: git_repo
  url: kernel:fs/xfs/xfsprogs-dev.git
  track: v*.*.*
  ref: v7.2.0-0-g84c54d6c0c3b65a3d1f10c4d3ac926bf9ef49b0b
