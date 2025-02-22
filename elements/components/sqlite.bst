kind: autotools

build-depends:
- public-stacks/buildsystem-make.bst
- components/tcl.bst
- components/patchelf.bst

depends:
- public-stacks/runtime-minimal.bst
- components/zlib.bst

variables:
  conf-local: >-
    --fts5
    --rtree
    --geopoly
    --soname=legacy
    CFLAGS="${CFLAGS}
    -DSQLITE_ENABLE_COLUMN_METADATA=1
    -DSQLITE_SECURE_DELETE=1
    -DSQLITE_ENABLE_FTS3=1
    -DSQLITE_ENABLE_UNLOCK_NOTIFY=1
    -DSQLITE_ENABLE_DBSTAT_VTAB=1"

  make-args: >-
    LDFLAGS.rpath=""

config:
  install-commands:
    (>):
    - |
      patchelf --remove-rpath %{install-root}%{indep-libdir}/tcl*/sqlite3/libtclsqlite3.so

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsqlite3.so'

  cpe:
    vendor: 'sqlite'

sources:
- kind: git_repo
  url: github:sqlite/sqlite.git
  track: version-*
  ref: version-3.49.1-0-g3cd92ce875fd4e5601e535c35fef33494a6684e3
