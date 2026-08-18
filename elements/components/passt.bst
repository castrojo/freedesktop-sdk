kind: make

depends:
- bootstrap-import.bst

variables:
  make-args: >-
    prefix="%{prefix}"
    exec_prefix="%{exec_prefix}"
    bindir="%{bindir}"
    datarootdir="%{datadir}"
    docdir="%{docdir}"
    mandir="%{mandir}"

sources:
- kind: git_repo
  url: fdsdk_mirror:passt/passt.git
  track: '*_*_*.*'
  ref: 2026_07_28.f8df3f1-0-gf8df3f1b228fe19a74a269334fdfe6cc7d0605ce
  version-guess-pattern: '(\d+)_(\d+)_(\d+)'
