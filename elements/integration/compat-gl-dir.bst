kind: manual
description: Creates a GL subdirectory, needed for the GL32 compat extension

variables:
  strip-binaries: ''

build-depends:
- public-stacks/runtime-gnu.bst

config:
  install-commands:
  - |
    mkdir -p "%{install-root}%{libdir}/GL"
