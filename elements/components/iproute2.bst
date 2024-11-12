kind: make

build-depends:
- public-stacks/buildsystem-make.bst
- bootstrap/sed.bst
- bootstrap/grep.bst
- components/bison.bst
- components/flex.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  make-args: >-
    PREFIX="%{prefix}"
    LIBDIR="%{libdir}"
    SBINDIR="%{sbindir}"
    DATADIR="%{datadir}"
    MANDIR="%{mandir}"

sources:
- kind: git_repo
  url: kernel:network/iproute2/iproute2.git
  track: v*
  ref: v6.11.0-0-gb19d4d6eef2f97e55d03eb7f1f2e528def72296d
