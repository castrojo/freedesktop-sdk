# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/xxhash.bst
- components/lz4.bst
# Uses libuuid only
- components/util-linux-libs.bst
# FIXME: No fuse3 support yet
# - components/fuse3.bst

variables:
  conf-local: >-
    --enable-lzma
    --enable-lz4
    --disable-fuse
    --enable-multithreading

sources:
- kind: git_repo
  url: kernel:linux/kernel/git/xiang/erofs-utils.git
  track: v*.*
  ref: v1.9.1-0-gd3fbccba6e409c100843563b416c47cd82c87ca0
