# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- components/_private/python3-minimal.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    LIBDEST=$(python3 -c "import sysconfig; print(sysconfig.get_path('purelib'))")
    mkdir -p $LIBDEST
    install -m 644 -D build.py "%{install-root}${LIBDEST}/build.py"
    python3 -m compileall -o 0 -o 1 -o 2 "%{install-root}${LIBDEST}/build.py"

  - |
    %{install-extra}

sources:
- kind: local
  path: files/python-bootstrap/build.py
