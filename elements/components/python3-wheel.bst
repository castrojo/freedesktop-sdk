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
    sha256sum: 4d4987ce51a49370ea65c0bfd2234e8ce80a12780820d9dc462597a6e60d0841
    suffix: 
      fb/d0/0b4c18a0b85c20233b0c3bc33f792aefd7f12a5832b4da77419949ff6fd9/wheel-0.41.3.tar.gz
