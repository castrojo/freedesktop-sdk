kind: autotools
description: GNU debugger

depends:
- bootstrap-import.bst
- components/python3.bst
- components/debuginfod.bst
- components/gmp.bst
- components/mpfr.bst
- components/zstd.bst

build-depends:
- components/pkg-config.bst
- components/texinfo.bst
- components/perl.bst
- components/flex.bst
- components/bison.bst

variables:
  # We are explicitly setting this as blank to suppress --enable-shared and
  # --disable-static from global arguments.
  conf-link-args: ""

  conf-local: >-
    --disable-binutils
    --disable-ld
    --disable-gold
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
  ref: gdb-15.2-release-0-g23c84db5b3cb4e8a0d555c76e1a0ab56dc8355f3
