kind: autotools

(@):
- elements/include/python3.yml

build-depends:
- bootstrap/gawk.bst
- bootstrap/gcc.bst
- bootstrap/grep.bst
- bootstrap/make.bst
- bootstrap/sed.bst
- bootstrap/stripper.bst
- components/autoconf.bst

depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/glibc.bst
- bootstrap/symlinks.bst
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
