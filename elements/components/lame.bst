# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/mpg123.bst

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
- kind: anitya
  project-id: 12523
  url: sourceforge:projects/lame/files/lame/{version}/lame-{version}.tar.gz
  ref:
    version: 4.0
    sha256sum: 3df5124d5ad3a98312ffd7ba6a9b36230e4f8a3e66d3ce0f425e336c32d216eb
- kind: patch
  path: patches/lame/lame-4.0-pkgconfig-to-get-correct-libs.patch
- kind: patch
  path: patches/lame/svn-r6562.patch
- kind: patch
  path: patches/lame/svn-r6564.patch
