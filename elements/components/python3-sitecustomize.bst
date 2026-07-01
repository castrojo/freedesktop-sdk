# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

depends:
- components/python3.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    LIBDEST="$(python3 -c "import sysconfig; print(sysconfig.get_path('stdlib'))")"
    install -m 644 -D python3_sitecustomize.py "%{install-root}${LIBDEST}/sitecustomize.py"
    python3 -m compileall -o 0 -o 1 -o 2 "%{install-root}${LIBDEST}/sitecustomize.py"

  - |
    %{install-extra}

sources:
- kind: local
  path: files/python3_sitecustomize.py
