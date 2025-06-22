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
  install-conf: COMPILEALL_OPTS=-j1  # Used for deterministic compiling

  # Upstream default is -O3 and we should not override this
  local_flags: "-O3"

config:
  install-commands:
  - |
    if [ -n "%{build-dir}" ]; then
    cd %{build-dir}
    fi
    %{make-install} %{install-conf} DESTSHARED=/usr/lib/python%{version_long}/lib-dynload
