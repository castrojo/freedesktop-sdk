kind: manual
description: Creates VAAPI subdirectories, needed for VAAPI compat extensions

build-depends:
- public-stacks/runtime-minimal.bst

config:
  install-commands:
  - |
    mkdir -p "%{install-root}%{libdir}/dri/intel-vaapi-driver"
