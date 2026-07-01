# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

build-depends:
- public-stacks/buildsystem-make.bst
- components/_private/git-minimal.bst
- components/pkg-config.bst
- components/systemd.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  make-args: >-
    BINDIR="%{bindir}"
    MANDIR="%{mandir}"
    SYSTEMD_DIR="$(pkg-config --variable=systemd_system_unit_dir systemd)"
    CWFLAGS=""
    CHECK_RUN_DIR=0

  make-install: make -j1 %{make-install-args} install-systemd

config:
  install-commands:
    (>):
    - |
      tmpfilesdir="$(pkg-config --variable tmpfilesdir systemd)"
      install -Dm644 -t  "%{install-root}${tmpfilesdir}" extra/mdadm.conf

sources:
- kind: git_repo
  url: kernel:utils/mdadm/mdadm.git
  track: mdadm-*
  exclude:
  - mdadm-*rc*
  ref: mdadm-4.6-0-g8b414a0d4753693d67b9a5822994e5f0c91b0b0a
- kind: local
  path: files/mdadm
  directory: extra
