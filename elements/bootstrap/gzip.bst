# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: GNU zip

(@):
- elements/bootstrap/include/target.yml

build-depends:
- bootstrap/build/debug-utils.bst
- bootstrap/build/gcc-stage2.bst
- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"

- bootstrap/gnu-config.bst

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
  url: ftp_gnu_org:gzip/gzip-1.15.tar.xz
  ref: 9aa0cc780dec156b8282844833b342ab7cb08c25d2cd9a1869cdd0df31deff48
- kind: local
  path: files/gzip/wrapper.sh
- kind: patch
  path: patches/gzip/0001-build-avoid-failure-to-build-on-linux-aarch64.patch
