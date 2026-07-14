# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- components/_private/python3-minimal.bst

depends:
- public-stacks/runtime-minimal.bst

config:
  install-commands:
  - |
    LIBDEST=$(python3 -c "import sysconfig; print(sysconfig.get_path('purelib'))")
    mkdir -p $LIBDEST
    install -m 644 -D installer.py "%{install-root}${LIBDEST}/installer.py"
    python3 -m compileall -o 0 -o 1 -o 2 "%{install-root}${LIBDEST}/installer.py"

  - |
    %{install-extra}

variables:
  strip-binaries: ''

sources:
- kind: local
  path: files/python-bootstrap/installer.py
