# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: GNU zip

(@):
- elements/bootstrap/include/target.yml

build-depends:
- bootstrap/gnu-config.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/glibc.bst

(?):
- target_arch == "i686":
    variables:
      conf-local: >-
        TIME_T_32_BIT_OK=yes

config:
  install-commands:
    (>):
    - |
      mv %{install-root}%{bindir}/gzip %{install-root}%{bindir}/gzip.bin
      install -D -m 0755 wrapper.sh "%{install-root}%{bindir}/gzip"

sources:
- kind: tar
  url: ftp_gnu_org:gzip/gzip-1.14.tar.xz
  ref: 01a7b881bd220bfdf615f97b8718f80bdfd3f6add385b993dcf6efd14e8c0ac6
- kind: local
  path: files/gzip/wrapper.sh
