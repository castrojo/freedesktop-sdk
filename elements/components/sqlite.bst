kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/tcl.bst

depends:
- public-stacks/runtime-minimal.bst

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

  cpe:
    vendor: 'sqlite'

sources:
- kind: git_repo
  url: github:sqlite/sqlite.git
  track: version-*
  ref: version-3.47.1-0-g0592ffed8244e2a8de0a2ab083fbf14335033922
