kind: manual

build-depends:
- components/python3-installer.bst
- components/python3-flit-core.bst

depends:
- components/python3.bst
- components/python3-setuptools.bst

environment:
  PYTHONPATH: "%{build-root}/src"

config:
  build-commands:
  - |
    python -m flit_core.wheel

  install-commands:
  - |
    python3 -minstaller dist/*.whl --destdir %{install-root}

sources:
- kind: pypi
  name: wheel
  ref:
    sha256sum: a29c3f2817e95ab89aa4660681ad547c0e9547f20e75b0562fe7723c9a2a9d49
    suffix: 
      b7/a0/95e9e962c5fd9da11c1e28aa4c0d8210ab277b1ada951d2aee336b505813/wheel-0.44.0.tar.gz
