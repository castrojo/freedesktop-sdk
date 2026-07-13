# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

(@):
- elements/include/efitools.yml

config:
  install-commands:
    (>):
    - rm -rvf "%{install-root}%{datadir}/efitools/efi/"
