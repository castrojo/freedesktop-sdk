# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: |
  GNU debugger. This ships with a dummy libdebuginfod library. Use
  components/gdb-debuginfod.bst for the actual libdebuginfod

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/flex.bst
- components/perl.bst
- components/texinfo.bst

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/xxhash.bst
- components/elfutils.bst
- components/gmp.bst
- components/mpfr.bst
- components/python3.bst
- components/zstd.bst

variables:
  # arches supported by the runtime only
  cross-debug-targets: "aarch64-linux-gnu,powerpc-linux-gnu,riscv-linux-gnu,x86_64-linux-gnu,i686-linux-gnu"

  # We are explicitly setting this as blank to suppress --enable-shared and
  # --disable-static from global arguments.
  conf-link-args: ""

  conf-local: >-
    --disable-binutils
    --disable-ld
    --disable-gas
    --disable-sim
    --disable-gprof
    --disable-gprofng
    --disable-libctf
    --without-zlib
    --with-system-zlib
    --with-python=/usr/bin/python3
    --disable-readline
    --with-system-readline
    --disable-install-libiberty
    --with-debuginfod
    --with-separate-debug-dir="%{debugdir}"
    --with-zstd
    --enable-targets="%{cross-debug-targets}"
    --enable-languages=all

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"
      # remove overlapped files with binutils
      rm -f "%{install-root}%{infodir}/bfd.info"
      rm -f "%{install-root}%{infodir}/sframe-spec.info"
      rm -f "%{install-root}%{datadir}"/locale/*/LC_MESSAGES/bfd.mo
      rm -f "%{install-root}%{datadir}"/locale/*/LC_MESSAGES/opcodes.mo

    # Headers that overlap with binutils
    - |
      rm "%{install-root}%{includedir}/"*.h

    - |
      rm "%{install-root}%{libdir}/"*.a

sources:
- kind: git_repo
  url: sourceware:binutils-gdb.git
  track: gdb-*.*
  ref: gdb-17.2-release-0-g7adf9fa6b1ccb3c70f86cb630368b9d3dffcf3aa
