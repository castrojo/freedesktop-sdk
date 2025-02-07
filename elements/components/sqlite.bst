kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/tcl.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  conf-local: >-
    --fts5
    --disable-static
    --soname=legacy
    CFLAGS="${CFLAGS}
    -DSQLITE_ENABLE_COLUMN_METADATA=1
    -DSQLITE_SECURE_DELETE=1
    -DSQLITE_ENABLE_FTS3=1
    -DSQLITE_ENABLE_UNLOCK_NOTIFY=1
    -DSQLITE_ENABLE_DBSTAT_VTAB=1"

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
  ref: version-3.49.0-0-g659bafd05dee789298074283ce857e27e65ef675
