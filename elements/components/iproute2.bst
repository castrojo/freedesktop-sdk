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
  ref: v7.0.0-0-g4151eafe813535de1ce756e978874dca43f439e4
