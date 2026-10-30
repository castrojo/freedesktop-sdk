# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/scdoc.bst

depends:
- public-stacks/runtime-minimal.bst
- components/openssl.bst
- components/xz.bst
- components/zlib.bst
- components/zstd.bst

variables:
  conf-local: >-
    --with-xz
    --with-zlib
    --with-zstd
    --with-openssl
    --enable-tools

sources:
- kind: git_repo
  url: kernel:utils/kernel/kmod/kmod.git
  track: v*
  ref: v34.3-0-g8f674de3856030dc76e33a41b5f232e2cdcbbb98
