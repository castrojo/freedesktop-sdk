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
  ref: 2026_01_17.81c97f6-0-g81c97f66595f4fab5171ebcb42f43e9f1505b4c4
