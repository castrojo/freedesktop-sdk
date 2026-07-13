# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script

build-depends:
- components/_private/systemd-stage1.bst

config:
  commands:
  - |
    systemd-hwdb --usr update
    mkdir -p %{install-root}%{indep-libdir}/udev/
    mv %{indep-libdir}/udev/hwdb.bin %{install-root}%{indep-libdir}/udev/
