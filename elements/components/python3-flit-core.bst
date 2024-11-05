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
  ref: 3.10.1-0-g7cc7d330d38d48ef865c07e5086a917278b19050
