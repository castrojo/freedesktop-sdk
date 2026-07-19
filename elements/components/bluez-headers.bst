# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual
description: |
  This element provides just the headers required to build
  Python. Because Bluez depends on Python, we cannot build Python without
  this element. Full elements is `components/bluez.bst`.

(@):
- elements/include/bluez.yml

build-depends:
- public-stacks/runtime-minimal.bst
- bootstrap/bash.bst
- bootstrap/coreutils.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    install -D -m644 -t "%{install-root}%{includedir}/bluetooth" lib/bluetooth/*.h

  - |
    %{install-extra}
