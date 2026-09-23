# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/flex.bst
- components/perl.bst
- components/systemd.bst

depends:
- components/polkit-gobject.bst
- components/systemd-libs.bst

variables:
  meson-local: >-
    -Dsystemdunit="system"

config:
  install-commands:
    (>):
    - find "%{install-root}" -name "lib*.a" -delete

sources:
- kind: git_repo
  url: github:LudovicRousseau/PCSC.git
  track: '*.*.*'
  ref: 2.5.2-0-g6cadd8152f3cfdb79131a65843d9b85f01f0ae51
