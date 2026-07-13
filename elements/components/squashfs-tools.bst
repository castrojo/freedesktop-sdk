# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

build-depends:
- public-stacks/buildsystem-make.bst
- components/help2man.bst
- components/which.bst

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/xz.bst
- bootstrap/zlib-ng.bst
- components/lzo.bst
- components/zstd.bst

variables:
  make-args: >-
    GZIP_SUPPORT=1
    XZ_SUPPORT=1
    LZO_SUPPORT=1
    ZSTD_SUPPORT=1
    INSTALL_PREFIX=%{install-root}%{prefix}
    INSTALL_MANPAGES_DIR=%{install-root}%{mandir}/man1

  command-subdir: squashfs-tools

sources:
- kind: git_repo
  url: github:plougher/squashfs-tools.git
  track: squashfs-tools-*
  ref: squashfs-tools-4.6.1-0-gd8cb82d9840330f9344ec37b992595b5d7b44184
