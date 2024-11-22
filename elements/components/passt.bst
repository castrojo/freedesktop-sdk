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
  ref: 2024_11_21.238c69f-0-g238c69f9af458e41dea5ad8c988dbf65b05b5172
