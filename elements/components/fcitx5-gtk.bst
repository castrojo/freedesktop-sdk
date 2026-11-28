# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/extra-cmake-modules.bst
- components/python3.bst

depends:
- public-stacks/runtime-minimal.bst
- components/gtk3.bst

variables:
  license-files-extra: LICENSES/LGPL-2.1-or-later.txt
  cmake-local: >-
    -DENABLE_GTK3_IM_MODULE=On
    -DENABLE_GTK2_IM_MODULE=Off
    -DENABLE_GIR=Off
    -DENABLE_GTK4_IM_MODULE=Off

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libFcitx5GClient.so'

sources:
- kind: git_repo
  url: github:fcitx/fcitx5-gtk.git
  track: '*.*.*'
  ref: 5.1.8-0-gecd41935f2dbc2afbd6854dcd786234ecde60c35
