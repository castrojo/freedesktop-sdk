# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

(@):
- elements/include/linux.yml

build-depends:
- public-stacks/buildsystem-make.bst
- components/audit.bst
- components/bc.bst
- components/bison.bst
- components/flex.bst
- components/gzip.bst
- components/kmod.bst
- components/pkg-config.bst
- components/python3-setuptools.bst
- components/python3.bst
- components/which.bst

depends:
- components/libcap.bst
- components/libtraceevent.bst
- components/libunwind.bst
- components/perl.bst
- components/slang.bst

variables:
  (?):
  - target_arch == "aarch64":
      kernel_arch: arm64
  - target_arch == "i686":
      kernel_arch: i386
  - target_arch == "ppc64le":
      kernel_arch: powerpc
  - target_arch == "riscv64":
      kernel_arch: riscv
  - target_arch == "loongarch64":
      kernel_arch: loongarch

  kernel_arch: '%{arch}'
  local_flags: >-
    -Wno-error

  # Note: CFLAGS environment is ignored and should be passed as
  # EXTRA_CFLAGS instead. LFLAGS works.
  make-args: >-
    -C "tools/perf"
    prefix='%{prefix}'
    bindir='%{bindir}'
    libdir='%{libdir}'
    mandir='%{mandir}'
    infodir='%{infodir}'
    sharedir='%{datadir}'
    sysconfidir='%{sysconfdir}'
    lib='%{lib}'
    NO_GTK2=1
    PYTHON=python3
    WERROR=0
    ARCH='%{kernel_arch}'
    EXTRA_CFLAGS='%{target_flags}'

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{bindir}/trace"
      ln -s perf "%{install-root}%{bindir}/trace"
