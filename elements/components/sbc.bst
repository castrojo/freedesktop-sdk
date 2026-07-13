# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/sndfile.bst

sources:
- kind: git_repo
  url: kernel:bluetooth/sbc.git
  track: '*.*'
  ref: 2.2-0-gb3deb8a5dcfb42d8c10ba1f2f1ac9bd7bf7271cc
- kind: patch
  path: patches/sbc/only-run-x86-code-on-x86.patch
