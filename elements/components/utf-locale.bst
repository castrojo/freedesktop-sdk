# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
# Needed for libgcc_s, see commit message for details
- bootstrap/gcc.bst
- bootstrap/glibc.bst
- bootstrap/gzip.bst

environment:
  LC_ALL: C

config:
  commands:
  - |
    mkdir -p %{install-root}/usr/lib/locale

  - |
    localedef --prefix=%{install-root} --no-archive -i en_US -f UTF-8 en_US.UTF-8
    localedef --prefix=%{install-root} --no-archive -i C -f UTF-8 C.UTF-8
