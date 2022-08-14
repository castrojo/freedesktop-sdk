kind: manual

depends:
- components/python3.bst

variables:
  command-subdir: flit_core

config:
  build-commands:
  -  python -m flit_core.wheel
  install-commands:
  - |
    python bootstrap_install.py dist/*.whl --install-root "%{install-root}"
    python3 -m compileall -o 0 -o 1 -o 2 "%{install-root}"

sources:
- kind: pypi
  name: flit
  ref:
    sha256sum: 3c9bd9c140515bfe62dd938c6610d10d6efb9e35cc647fc614fe5fb3a5036682
    suffix: a0/62/4fe47656976da4a95bbe9ab3cc710b2c16a0b5a5ffa308780a2ab208ef50/flit-3.7.1.tar.gz
- kind: patch
  path: patches/flit/install-root.patch
