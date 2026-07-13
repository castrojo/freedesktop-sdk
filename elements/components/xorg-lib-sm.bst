# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: X.org lib SM

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-lib-ice.bst
- components/xorg-lib-xtrans.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSM.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libsm.git
  track: libSM-*
  ref: libSM-1.2.6-0-g5f6da959a34bcefc425b6e37462553acf44369a3
