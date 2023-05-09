kind: manual
description: Creates a GL subdirectory, needed for GL debug extensions

build-depends:
- bootstrap-import.bst

config:
  install-commands:
  - |
    mkdir -p "%{install-root}%{debugdir}%{libdir}/GL"
