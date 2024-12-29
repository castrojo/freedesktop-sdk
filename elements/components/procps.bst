kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
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
        - '%{libdir}/libproc2.so'

sources:
- kind: git_repo
  url: gitlab:procps-ng/procps.git
  track: v*
  exclude:
  - '*rc*'
  ref: v4.0.5-0-gf46b2f7929cdfe2913ed0a7f585b09d6adbf994e
