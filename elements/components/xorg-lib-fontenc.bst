# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-font-util.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-proto-xorgproto.bst

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libfontenc.git
  track: libfontenc-*
  ref: libfontenc-1.1.9-0-g780d1f6f192a331de7b298a96e23ebc44d2a884b
