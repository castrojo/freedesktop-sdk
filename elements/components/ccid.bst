# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/flex.bst
- components/perl.bst
- components/systemd.bst

depends:
- components/libfl.bst
- components/libusb.bst
- components/pcsc-lite.bst

sources:
- kind: git_repo
  url: github:LudovicRousseau/CCID.git
  track: '*.*.*'
  ref: 1.8.4-0-gc37cf6cb42279ce9648ff7314180c866d68f9e0d
