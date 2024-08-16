kind: autotools

build-depends:
- bootstrap/gcc.bst
- components/autoconf.bst

depends:
- bootstrap/acl.bst
- bootstrap/attr.bst
- bootstrap/bash.bst
- bootstrap/bzip2.bst
- bootstrap/binutils.bst
- bootstrap/coreutils.bst
- bootstrap/debugedit.bst
- bootstrap/diffutils.bst
- bootstrap/dwz.bst
- bootstrap/elfutils.bst
- bootstrap/file.bst
- bootstrap/findutils.bst
- bootstrap/gawk.bst
- bootstrap/glibc.bst
- bootstrap/gnu-config.bst
- bootstrap/grep.bst
- bootstrap/stripper.bst
- bootstrap/linux-headers.bst
- bootstrap/make.bst
- bootstrap/ncurses.bst
- bootstrap/pcre2.bst
- bootstrap/readline.bst
- bootstrap/sed.bst
- bootstrap/symlinks.bst
- bootstrap/utf-locale.bst
- components/openssl.bst

variables:
  install-conf: COMPILEALL_OPTS=-j1  # Used for deterministic compiling

config:
  install-commands:
  - |
    if [ -n "%{build-dir}" ]; then
    cd %{build-dir}
    fi
    %{make-install} %{install-conf} DESTSHARED=/usr/lib/python%{version_long}/lib-dynload

(@):
- elements/include/python3.yml
