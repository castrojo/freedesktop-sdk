kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/systemd.bst

depends:
- bootstrap-import.bst
- components/systemd-libs.bst

variables:
  conf-local: >-
    --with-ncurses
    --with-systemd

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libprocps.so'

sources:
- kind: git_repo
  url: gitlab:procps-ng/procps.git
  track: v*
  exclude:
  - '*rc*'
  ref: v3.3.17-0-g19a508ea121c0c4ac6d0224575a036de745eaaf8
