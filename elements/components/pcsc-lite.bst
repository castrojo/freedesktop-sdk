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
  ref: 2.5.4-0-ga9848cc4f119903f338fb3231c030640d7ca8932
