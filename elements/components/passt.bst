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
  url: passt:passt
  track: '*_*_*.*'
  ref: 2024_03_20.71dd405-0-g71dd405460b7b1251af9a71aa30c74b7d40da1c3
