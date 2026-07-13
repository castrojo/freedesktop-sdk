kind: make

depends:
- bootstrap-import.bst

variables:
  make-args: >-
    PREFIX="%{prefix}"
    BINDIR="%{prefix}/bin"
    MANDIR="%{mandir}"
    PCDIR="%{datadir}/pkgconfig"
    LDFLAGS="${LDFLAGS}"

sources:
- kind: git_repo
  track: '*.*.*'
  url: sourcehut:sircmpwn/scdoc
  ref: 1.11.5-0-g24be30ef17d5ca0162f11b35258c8fa2413d556a
