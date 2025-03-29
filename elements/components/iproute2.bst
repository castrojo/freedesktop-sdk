kind: make

build-depends:
- public-stacks/buildsystem-make.bst
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
  ref: v6.14.0-0-gfea1086cdabcf058a311b944089290bf7dec0aca
