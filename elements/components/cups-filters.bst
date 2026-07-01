# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/ghostscript.bst
- components/mutool.bst

depends:
- components/libppd.bst

sources:
- kind: git_repo
  url: github:OpenPrinting/cups-filters.git
  track: '*.*.*'
  ref: 2.0.1-0-g5a73330fbd0cde494d984141f9add1565aef8171
- kind: patch
  path: patches/cups-filters/Fix-build-failure-with-GCC-15-and-std-c23-618.patch
