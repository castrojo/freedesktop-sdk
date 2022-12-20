kind: manual

depends:
- filename: bootstrap-import.bst

environment:
  BSTARCH: '%{arch}'

config:
  configure-commands:
  - |
    sh Configure -des \
      -Dprefix="%{prefix}" \
      -Dvendorprefix="%{prefix}" \
      -Dman1dir="%{mandir}/man1" \
      -Dman3dir="%{mandir}/man3" \
      -Dlibpth="%{libdir}" \
      -Dcc=gcc \
      -Duseshrplib \
      -Doptimize="none" \
      -Dccflags="$CFLAGS" \
      -Dldflags="$LDFLAGS" \
      -Dlddlflags="-shared $LDFLAGS"

  build-commands:
  - |
    make

  install-commands:
  - |
    make -j1 DESTDIR="%{install-root}" install

  - |
    rm "%{install-root}%{bindir}/perl"
    ln -sr "%{install-root}%{bindir}"/perl[0-9]* "%{install-root}%{bindir}/perl"

sources:
- kind: git_repo
  url: github:perl/perl5.git
  # Tracking is expected to be changed to a maintenance branch post-release
  track: v5.*[02468].*
  exclude:
  - v*-RC*
  ref: v5.36.0-0-gb3c502b607191da0e743a4fa34501a05442305b3
- kind: local
  path: files/perl/config.over
- kind: patch
  path: patches/perl/no-rpath-libpath.patch
