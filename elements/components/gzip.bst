kind: autotools
description: GNU zip

build-depends:
- bootstrap/gcc.bst

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

(?):
- target_arch == "i686":
    variables:
      conf-local: TIME_T_32_BIT_OK=yes

sources:
- kind: tar
  url: ftp_gnu_org:gzip/gzip-1.13.tar.xz
  ref: 7454eb6935db17c6655576c2e1b0fabefd38b4d0936e0f87f48cd062ce91a057
