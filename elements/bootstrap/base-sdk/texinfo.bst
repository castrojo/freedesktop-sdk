kind: autotools
description: GNU texinfo

build-depends:
- bootstrap/gnu-config.bst

depends:
- bootstrap/base-sdk/perl.bst

(@):
- elements/bootstrap/include/base-sdk.yml

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

sources:
- kind: tar
  url: ftp_gnu_org:texinfo/texinfo-6.8.tar.xz
  ref: 8eb753ed28bca21f8f56c1a180362aed789229bd62fff58bf8368e9beb59fec4
- kind: patch
  path: patches/texinfo/texinfo-6.8-undo-gnulib-nonnul.patch
