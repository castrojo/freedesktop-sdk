# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: GNU texinfo

(@):
- elements/include/texinfo-source.yml

build-depends:
- bootstrap/gcc.bst
- bootstrap/grep.bst
- bootstrap/make.bst
- bootstrap/stripper.bst

depends:
- components/bash.bst
- components/coreutils.bst
- components/gawk.bst
- public-stacks/runtime-minimal.bst
- components/ncurses.bst
- components/sed.bst
- components/symlinks.bst
- components/perl.bst
- components/utf-locale.bst

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
