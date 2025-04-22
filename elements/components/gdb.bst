kind: autotools
description: |
  GNU debugger. This ships with a dummy libdebuginfod library. Use
  components/gdb-debuginfod.bst for the actual libdebuginfod

depends:
- bootstrap/xxhash.bst
- components/elfutils.bst
- components/gmp.bst
- components/mpfr.bst
- components/python3.bst
- components/zstd.bst
- public-stacks/runtime-minimal.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/texinfo.bst
- components/perl.bst
- components/flex.bst
- components/bison.bst

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
  ref: gdb-16.3-release-0-g140ba011c003fda0fb2f746cf2bc0f010bf4ac03
