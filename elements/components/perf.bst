kind: make

build-depends:
- components/audit.bst
- components/bison.bst
- components/flex.bst
- components/bc.bst
- components/gzip.bst
- components/kmod.bst
- components/pkg-config.bst
- components/python3.bst
- components/python3-setuptools.bst

depends:
- components/libunwind.bst
- components/libcap.bst
- components/libtraceevent.bst
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

  kernel_arch: '%{arch}'
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

(@):
- elements/include/linux.yml
