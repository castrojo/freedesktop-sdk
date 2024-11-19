kind: make

depends:
- public-stacks/runtime-minimal.bst

build-depends:
- public-stacks/buildsystem-make.bst
- components/bison.bst
- components/flex.bst
- components/pkg-config.bst

variables:
  make-args: >-
    PREFIX="%{prefix}"
    LIBDIR="%{libdir}"

config:
  configure-commands:
  - |
    sed -i "s/-Werror//g" Makefile

sources:
- kind: git_repo
  url: kernel:utils/dtc/dtc.git
  track: v*
  ref: v1.7.2-0-g2d10aa2afe35527728db30b35ec491ecb6959e5c
