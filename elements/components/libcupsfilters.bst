# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/mutool.bst

depends:
- components/cups.bst
- components/dbus.bst
- components/fontconfig.bst
- components/ghostscript.bst
- components/jpeg.bst
- components/lcms.bst
- components/libexif.bst
- components/libpng.bst
- components/libtiff.bst
- components/poppler.bst
- components/qpdf.bst

config:
  build-commands:
    (<):
    - |
      ln -s "%{build-dir}/config.h" "config.h"

sources:
- kind: git_repo
  url: github:OpenPrinting/libcupsfilters.git
  track: '*.*.*'
  exclude:
  - '*rc*'
  ref: 2.1.1-0-gc4028517ba4a0d84e649e8e258508c5e90dde36e
