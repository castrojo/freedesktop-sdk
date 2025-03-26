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
- kind: git_repo
  url: github:pypa/flit.git
  track: '*.*.*'
  ref: 3.12.0-0-g1c8141722066ffe1497e511982feeea0f091ddb6
- kind: patch
  path: patches/python3-flit-core/drop-lic-pattern.patch
