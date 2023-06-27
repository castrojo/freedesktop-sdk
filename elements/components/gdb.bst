kind: autotools
description: GNU debugger

depends:
- bootstrap-import.bst
- components/python3.bst
- components/debuginfod.bst
- components/gmp.bst

build-depends:
- components/pkg-config.bst
- components/texinfo.bst
- components/perl.bst
- components/flex.bst
- components/bison.bst

variables:
  conf-link-args: >-
    --enable-shared

  # disable this one when gdb has caught up with binutils 2.40
  conf-libbfd: >-
    --enable-install-libbfd

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
    %{conf-libbfd}

  # Work-around for missing libopcodes, remove it when gdb
  # gets updated and we get conflicts
  make-install-args: >-
    %{make-args}
    DESTDIR="%{install-root}"
    install install-opcodes

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

    - |
      rm "%{install-root}%{includedir}/ansidecl.h"
      rm "%{install-root}%{includedir}/bfd.h"
      rm "%{install-root}%{includedir}/bfdlink.h"
      rm "%{install-root}%{includedir}/diagnostics.h"
      rm "%{install-root}%{includedir}/dis-asm.h"
      rm "%{install-root}%{includedir}/plugin-api.h"
      rm "%{install-root}%{includedir}/sframe-api.h"
      rm "%{install-root}%{includedir}/sframe.h"
      rm "%{install-root}%{includedir}/symcat.h"
      rm "%{install-root}%{libdir}"/libsframe*
      rm "%{install-root}%{libdir}/libbfd.so"
      rm "%{install-root}%{libdir}/libopcodes.so"
      rm "%{install-root}%{libdir}"/lib*.a

sources:
- kind: git_repo
  url: sourceware:binutils-gdb.git
  track: gdb-*.*
  ref: gdb-13.2-release-0-g662243de0e14a4945555a480dca33c0e677976eb

