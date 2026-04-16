kind: manual
description: Creates VAAPI subdirectories, needed for VAAPI compat extensions

build-depends:
- public-stacks/runtime-gnu.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    mkdir -p "%{install-root}%{libdir}/dri/intel-vaapi-driver"
