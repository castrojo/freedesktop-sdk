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
  ref: v4.0.4-0-g4ddcef2fd843170c8e2d59a83042978f41037a2b
- kind: patch
  # https://gitlab.com/procps-ng/procps/-/merge_requests/192
  path: patches/procps/0001-nls-Fix-French-language-file-for-gettext-0.22.patch
