kind: autotools

build-depends:
- components/tcl.bst

depends:
- bootstrap-import.bst

variables:
  conf-local: >-
    --enable-fts5
    CFLAGS="${CFLAGS}
    -DSQLITE_ENABLE_COLUMN_METADATA=1
    -DSQLITE_SECURE_DELETE=1
    -DSQLITE_ENABLE_FTS3=1
    -DSQLITE_ENABLE_UNLOCK_NOTIFY=1
    -DSQLITE_ENABLE_DBSTAT_VTAB=1"

config:
  configure-commands:
    (>):
    - sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' %{build-dir}/libtool
    - sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' %{build-dir}/libtool

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsqlite3.so'

  cpe:
    vendor: 'sqlite'

sources:
- kind: git_tag
  url: github:sqlite/sqlite.git
  track: master
  track-extra:
  - branch-3.39
  match:
  - 'version-*'
  ref: version-3.39.2-0-g202b2a7b54ea2dd13a8a5adfd75523abe4dcf17f
