kind: autotools
description: GNU texinfo

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
- components/perl.bst

variables:
  conf-local: |
    PERL_EXT_CFLAGS="$CFLAGS" \
    PERL_EXT_LDFLAGS="$LDFLAGS"

public:
  bst:
    integration-commands:
    - |
      rm -f "%{infodir}/dir"
      for f in "%{infodir}"/*; do
        case "$(basename "${f}")" in
          *.png|*.jpg|*-[0-9])
            ;;
          *)
            install-info --info-dir="%{infodir}" "${f}"
            ;;
        esac
      done

(@):
- elements/include/texinfo-source.yml
