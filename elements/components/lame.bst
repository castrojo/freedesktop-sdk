# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  conf-local: |
    --enable-dynamic-frontends

config:
  configure-commands:
    (<):
    - |
      autoreconf -ivf -I %{datadir}/gettext/m4

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libmp3lame.so'

sources:
- kind: tar
  url: sourceforge:projects/lame/files/lame/3.100/lame-3.100.tar.gz
  ref: ddfe36cab873794038ae2c1210557ad34857a4b6bdc515785d1da9e175b1da1e
- kind: patch
  path: patches/lame/lame-3.100.5-pkgconfig-to-get-correct-libs.patch
