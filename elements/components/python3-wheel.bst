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
    sha256sum: c45be39f7882c9d34243236f2d63cbd58039e360f85d0913425fbd7ceea617a8
    suffix: 
      b0/b4/bc2baae3970c282fae6c2cb8e0f179923dceb7eaffb0e76170628f9af97b/wheel-0.42.0.tar.gz
