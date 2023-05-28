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
    --disable-install-libbfd
    --disable-install-libiberty
    --with-debuginfod
    --with-separate-debug-dir="%{debugdir}"

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

sources:
- kind: git_repo
  url: sourceware:binutils-gdb.git
  track: gdb-*.*
  ref: gdb-13.2-release-0-g662243de0e14a4945555a480dca33c0e677976eb

