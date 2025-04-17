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
  (?):
  - target_arch == "loongarch64":
      configure-commands:
        (<):
        - |
          cp -v %{datadir}/gnu-config/config* .

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsqlite3.so'
      tcl:
        - '%{indep-libdir}/tcl*/**'

  cpe:
    vendor: 'sqlite'

sources:
- kind: git_repo
  url: github:sqlite/sqlite.git
  track: version-*
  ref: version-3.46.1-0-gf3d536d37825302e31ed0eddd811c689f38f85a3
