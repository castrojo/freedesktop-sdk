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
    sha256sum: 55a0f0a5a84869bce5ba775abfd9c462e3a6b1b7b7ec69d72c0b83d673a5114d
    suffix: ec/34/903929e15b2657335b2ce8723d92fc804d3569b7ac0f1f8877ed1a7b2024/wheel-0.41.0.tar.gz
