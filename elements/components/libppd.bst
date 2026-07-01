# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/ghostscript.bst
- components/mutool.bst

depends:
- components/libcupsfilters.bst

sources:
- kind: git_repo
  url: github:OpenPrinting/libppd.git
  track: '*.*.*'
  exclude:
  - '*rc*'
  ref: 2.1.1-0-g2b37a73c02126d1ba031270322b6c79034cc0d0f
