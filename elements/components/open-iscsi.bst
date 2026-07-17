# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/perl.bst
- components/systemd.bst

depends:
- components/kmod.bst
- components/open-isns.bst
- components/systemd-libs.bst

environment:
  KBUILD_BUILD_TIMESTAMP: 'Thu Nov 10 15:00:00 UTC 2011'

variables:
  meson-local: >-
    -Discsi_sbindir="%{sbindir}"

config:
  install-commands:
    (>):
    - |
      rm %{install-root}%{sysconfdir}/iscsi/initiatorname.iscsi

sources:
- kind: git_repo
  url: github:open-iscsi/open-iscsi.git
  track: '*.*.*'
  ref: 2.1.12-0-g7e00642c40123e0b3f949e74c3945872c17a407e
