kind: make

build-depends:
- public-stacks/buildsystem-make.bst

depends:
- public-stacks/runtime-minimal.bst

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
  url: gitlab:projects261/mirrors/passt.git
  track: '*_*_*.*'
  ref: 2025_08_05.309eefd-0-g309eefd6af5ba20f760b92b6131a9ea7f2e161d4
