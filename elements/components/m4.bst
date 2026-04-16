kind: autotools
description: GNU m4

(@):
- elements/include/m4-source.yml

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/gawk.bst
- bootstrap/gcc.bst
- bootstrap/grep.bst
- bootstrap/make.bst
- bootstrap/sed.bst
- bootstrap/stripper.bst

depends:
- bootstrap/glibc.bst
- bootstrap/symlinks.bst
- components/utf-locale.bst
