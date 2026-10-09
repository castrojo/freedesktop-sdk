# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

(@):
- elements/include/python3.yml

build-depends:
- bootstrap/bash.bst
- bootstrap/bzip2.bst
- bootstrap/coreutils.bst
- bootstrap/gawk.bst
- bootstrap/gcc.bst
- bootstrap/grep.bst
- bootstrap/make.bst
- bootstrap/sed.bst
- bootstrap/stripper.bst
- bootstrap/symlinks.bst
- bootstrap/zlib-ng.bst
- bootstrap/zstd.bst
- components/autoconf.bst

# Note that public-stacks/runtime-minimal.bst build-depends on this element
# via gcc-libs.bst -> gcc-base.bst.
runtime-depends:
- bootstrap/glibc.bst
- components/bzip2.bst
- components/symlinks.bst
- components/zlib-ng.bst
- components/zstd.bst

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
