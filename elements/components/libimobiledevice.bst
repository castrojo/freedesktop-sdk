# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libimobiledevice-glue.bst
- components/libplist.bst
- components/libtatsu.bst
- components/libusbmuxd.bst
- components/openssl.bst

variables:
  conf-local: --without-cython

sources:
- kind: git_repo
  url: github:libimobiledevice/libimobiledevice.git
  track: '*.*.*'
  ref: 1.4.0-0-g149f7623c672c1fa73122c7119a12bfc0012f2ac
