kind: autotools

build-depends:
- public-stacks/buildsystem-make.bst

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
  ref: version-3.50.3-0-ga4643b451a2941f5e6965ab095d3057bc7cb2222
