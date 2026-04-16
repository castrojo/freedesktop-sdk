kind: manual
description: Creates a GL subdirectory, needed for GL debug extensions

build-depends:
- public-stacks/runtime-gnu.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    mkdir -p "%{install-root}%{debugdir}%{libdir}/GL"
