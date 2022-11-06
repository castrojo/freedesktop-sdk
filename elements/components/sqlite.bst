kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/tcl.bst
  type: build

variables:
  conf-local: |
    --enable-fts5 \
    CFLAGS="${CFLAGS} \
    -DSQLITE_ENABLE_COLUMN_METADATA=1 \
    -DSQLITE_SECURE_DELETE=1 \
    -DSQLITE_ENABLE_FTS3=1 \
    -DSQLITE_ENABLE_UNLOCK_NOTIFY=1 \
    -DSQLITE_ENABLE_DBSTAT_VTAB=1"

config:
  configure-commands:
    (>):
    - sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' bst_build_dir/libtool
    - sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' bst_build_dir/libtool

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
  track: branch-3.36
  match:
  - 'version-*'
  ref: version-3.36.0-0-g6d72858e795481571a40c07675cc9d2c15b5b3ef
