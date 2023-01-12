kind: pyproject

build-depends:
- components/python3-flit-core.bst
- components/python3-installer.bst

config:
  build-commands:
  - python3 -mflit_core.wheel

sources:
- kind: pypi
  name: pyproject_hooks
  ref:
    sha256sum: f271b298b97f5955d53fb12b72c1fb1948c22c1a6b70b315c54cedaca0264ef5
    suffix: 25/c1/374304b8407d3818f7025457b7366c8e07768377ce12edfe2aa58aa0f64c/pyproject_hooks-1.0.0.tar.gz
