kind: make

build-depends:
- bootstrap/gawk.bst
- bootstrap/gcc.bst
- bootstrap/grep.bst
- bootstrap/make.bst
- bootstrap/sed.bst
- bootstrap/stripper.bst

depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/glibc.bst
- bootstrap/libxcrypt.bst
- bootstrap/symlinks.bst
- components/utf-locale.bst

environment:
  BSTARCH: '%{bootstrap_build_arch}'

config:
  configure-commands:
  - |
    ABI_VERSION="$(awk '/^#define PERL_REVISION/ {r=$3} /^#define PERL_VERSION/ {v=$3} END {print r "." v}' patchlevel.h)"
    sh Configure -des \
      -Dprefix="%{prefix}" \
      -Dvendorprefix="%{prefix}" \
      -Dprivlib="%{indep-libdir}/perl5/$ABI_VERSION" \
      -Darchlib="%{indep-libdir}/perl5/$ABI_VERSION/%{gcc_triplet}" \
      -Dsitelib="%{indep-libdir}/perl5/site_perl/$ABI_VERSION" \
      -Dsitearch="%{indep-libdir}/perl5/site_perl/$ABI_VERSION/%{gcc_triplet}" \
      -Dvendorlib="%{indep-libdir}/perl5/vendor_perl/$ABI_VERSION" \
      -Dvendorarch="%{indep-libdir}/perl5/vendor_perl/$ABI_VERSION/%{gcc_triplet}" \
      -Dman1dir="%{mandir}/man1" \
      -Dman3dir="%{mandir}/man3" \
      -Dlibpth="%{libdir}" \
      -Dcc=gcc \
      -Duseshrplib \
      -Doptimize="none" \
      -Dccflags="$CFLAGS" \
      -Dldflags="$LDFLAGS" \
      -Dlddlflags="-shared $LDFLAGS" \
      -Duse64bitint

  install-commands:
    (>):
    - |
      rm "%{install-root}%{bindir}/perl"
      ln -sr "%{install-root}%{bindir}"/perl[0-9]* "%{install-root}%{bindir}/perl"

(@):
- elements/include/perl-source.yml
