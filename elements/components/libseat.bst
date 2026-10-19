# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/scdoc.bst

depends:
- components/systemd-libs.bst

variables:
  meson-local: >-
    -Dlibseat-logind=systemd
    -Dexamples=disabled
    -Dman-pages=enabled

config:
  install-commands:
    (>):
    - |
      install -Dm644 -t "%{install-root}%{indep-libdir}/systemd/system" contrib/systemd/seatd.service

sources:
- kind: git_repo
  url: sourcehut:kennylevinsen/seatd
  track: '*.*.*'
  ref: 0.9.3-0-gdaa8196e10b180b8b0caeafa8e5f860eb1bd6706
