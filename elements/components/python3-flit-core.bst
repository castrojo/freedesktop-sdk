kind: manual

depends:
- components/python3.bst

variables:
  command-subdir: flit_core

config:
  build-commands:
  - rm -r flit_core/vendor
  - python -m flit_core.wheel
  install-commands:
  - |
    python bootstrap_install.py dist/*.whl --install-root "%{install-root}"
    python3 -m compileall -o 0 -o 1 -o 2 "%{install-root}"

sources:
- kind: pypi
  name: flit
  ref:
    sha256sum: d0f2a8f4bd45dc794befbf5839ecc0fd3830d65a57bd52b5997542fac5d5e937
    suffix: 28/c6/c399f38dab6d3a2518a50d334d038083483a787f663743d713f1d245bde3/flit-3.8.0.tar.gz

