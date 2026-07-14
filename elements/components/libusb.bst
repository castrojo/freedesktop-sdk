# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/systemd.bst

depends:
- components/systemd-libs.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libusb-1.0.so'

sources:
- kind: git_repo
  url: github:libusb/libusb.git
  track: v*
  exclude:
  - '*-rc*'
  ref: v1.0.30-0-g87a55632db62c9bdc58cd31d3ccfa673f1bb017f
