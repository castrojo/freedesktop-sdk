# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

(@):
- elements/include/python3.yml

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/gawk.bst
- bootstrap/gcc.bst
- bootstrap/grep.bst
- bootstrap/make.bst
- bootstrap/sed.bst
- bootstrap/stripper.bst
- components/autoconf.bst

depends:
- bootstrap/bzip2.bst
- bootstrap/glibc.bst
- bootstrap/symlinks.bst
- bootstrap/zlib-ng.bst
- bootstrap/zstd.bst
- components/utf-locale.bst

variables:
  compileall-opts: -j1  # Used for deterministic compiling
  conf-local: >-
    --with-platlibdir=lib
  make-install-args: >-
    DESTDIR="%{install-root}"
    COMPILEALL_OPTS=%{compileall-opts}
    install

  # Upstream default is -O3 and we should not override this
  local_flags: "-O3"

config:
  install-commands:
    (>):
    - |
      mkdir -p %{install-root}%{bindir}
      ln -s %{bindir}/python3 %{install-root}%{bindir}/python
