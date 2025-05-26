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
  ref: v6.15.0-0-g401816cc9c7cde7b666d4befb06a10d6359c9688
