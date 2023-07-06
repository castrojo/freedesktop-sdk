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
        - '%{libdir}/libproc2.so'

sources:
- kind: git_repo
  url: gitlab:procps-ng/procps.git
  track: v*
  exclude:
  - '*rc*'
  ref: v4.0.3-0-g806eb270f217ff7e1e745c7bda2b002b5be74be4
- kind: patch
  # https://gitlab.com/procps-ng/procps/-/merge_requests/192
  path: patches/procps/0001-nls-Fix-French-language-file-for-gettext-0.22.patch
