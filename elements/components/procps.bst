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
  cpe:
    patches:
    - CVE-2023-4016

sources:
- kind: git_tag
  url: gitlab:procps-ng/procps.git
  track: master
  exclude:
  - '*rc*'
  match:
  - 'v3.*'
  ref: v3.3.17-0-g19a508ea121c0c4ac6d0224575a036de745eaaf8
- kind: patch
  path: patches/procps/CVE-2023-4016.patch
