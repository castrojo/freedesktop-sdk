# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/xxhash.bst
- bootstrap/xz.bst
- components/fuse3.bst
- components/lz4.bst
# Uses libuuid only
- components/util-linux-libs.bst

variables:
  conf-local: >-
    --enable-lzma
    --enable-lz4
    --enable-fuse
    --enable-multithreading

sources:
- kind: git_repo
  url: kernel:linux/kernel/git/xiang/erofs-utils.git
  track: v*.*
  ref: v1.9.3-0-g7db78788b000999e2de88decd2ba90654f26171c
