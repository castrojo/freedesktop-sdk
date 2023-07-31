kind: manual

build-depends:
- components/python3-flit-core.bst
- components/python3-installer.bst

depends:
- components/python3.bst

config:
  build-commands:
  - python3 -mflit_core.wheel

  install-commands:
  - python3 -minstaller dist/*.whl --destdir %{install-root}

sources:
- kind: pypi
  name: pyparsing
  ref:
    sha256sum: ede28a1a32462f5a9705e07aea48001a08f7cf81a021585011deba701581a0db
    suffix: 37/fe/65c989f70bd630b589adfbbcd6ed238af22319e90f059946c26b4835e44b/pyparsing-3.1.1.tar.gz
