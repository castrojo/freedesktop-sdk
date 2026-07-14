# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: Python 3

(@):
- elements/include/python3.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bluez-headers.bst
# depends: add these to filters
- public-stacks/runtime-minimal.bst
- components/expat.bst
- components/libffi.bst
- components/gdbm.bst
- components/openssl.bst
- components/sqlite.bst

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/bzip2.bst
- bootstrap/xz.bst
- bootstrap/zlib-ng.bst
- components/expat.bst
- components/gdbm.bst
- components/libffi.bst
- components/openssl.bst
- components/sqlite.bst
- components/zstd.bst

variables:
  compileall-opts: -j1  # Used for deterministic compiling
  make-install-args: >-
    DESTDIR="%{install-root}"
    COMPILEALL_OPTS=%{compileall-opts}
    install
  conf-local: >-
    --enable-shared
    --without-ensurepip
    --with-system-expat
    --with-system-ffi
    --enable-loadable-sqlite-extensions
    --with-dbmliborder=gdbm
    --with-lto
    --with-conf-includedir="%{includedir}/%{gcc_triplet}"
    --without-static-libpython
    --with-platlibdir=lib

  # Upstream default is -O3 and we should not override this
  local_flags: "-O3"

config:
  install-commands:
    (>):
    - |
      rm -rf %{install-root}%{bindir}/idle*
    - |
      rm -rf %{install-root}%{indep-libdir}/python*/idlelib
    - |
      rm -rf %{install-root}%{indep-libdir}/python*/tkinter
    - |
      rm -rf %{install-root}%{indep-libdir}/python*/turtle*
    - |
      rm -rf %{install-root}%{indep-libdir}/python*/__pycache__/turtle.*
    - |
      rm -rf %{install-root}%{indep-libdir}/python*/test
    - |
      rm -rf %{install-root}%{indep-libdir}/python*/*/test
    - |
      rm -rf %{install-root}%{indep-libdir}/python*/*/tests

    - |
      find "%{install-root}" -name "lib*.a" -delete

    - |
      PYTHON_VERSION=$(./configure --version | grep -m1 'python configure' | awk '{print $3}')
      cat <<EOF >"%{install-root}%{includedir}/python${PYTHON_VERSION}/pyconfig.h"
      #if defined(__x86_64__)
      # include "x86_64-linux-gnu/python${PYTHON_VERSION}/pyconfig.h"
      #elif defined(__i386__)
      # include "i386-linux-gnu/python${PYTHON_VERSION}/pyconfig.h"
      #elif defined(__aarch64__)
      # include "aarch64-linux-gnu/python${PYTHON_VERSION}/pyconfig.h"
      #elif defined(__arm__)
      # include "arm-linux-gnueabihf/python${PYTHON_VERSION}/pyconfig.h"
      #elif defined(__powerpc64__)
      #if defined(__BIG_ENDIAN__)
      # include "powerpc64-linux-gnu/python${PYTHON_VERSION}/pyconfig.h"
      #else
      # include "powerpc64le-linux-gnu/python${PYTHON_VERSION}/pyconfig.h"
      #endif
      #elif defined(__riscv) && (__riscv_xlen == 64)
      # include "riscv64-linux-gnu/python${PYTHON_VERSION}/pyconfig.h"
      #elif defined(__loongarch__) && defined(__loongarch_double_float)
      # include "loongarch64-linux-gnu/python${PYTHON_VERSION}/pyconfig.h"
      #else
      # error "Unknown cross-compiler"
      #endif
      EOF

    - |
      mkdir -p %{install-root}%{bindir}
      ln -s %{bindir}/python3 %{install-root}%{bindir}/python

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/2to3*'
        - '%{bindir}/python*-config'
        - '%{libdir}/libpython*.so'
        - '%{indep-libdir}/python*/config-*-%{gcc_triplet}'
        - '%{indep-libdir}/python*/config-*-%{gcc_triplet}/**'
        - '%{indep-libdir}/python*/lib2to3'
        - '%{indep-libdir}/python*/lib2to3/**'

  cpe:
    product: python
    ignored:
    - CVE-2007-4559
    - CVE-2015-20107
