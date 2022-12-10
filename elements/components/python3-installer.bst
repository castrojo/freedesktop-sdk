kind: manual

build-depends:
- components/python3-flit-core.bst

depends:
- components/python3.bst

environment:
  PYTHONPATH: "%{build-root}/src"

config:
  build-commands:
  - |
    python3 -mflit_core.wheel

  install-commands:
  - |
    python3 -minstaller dist/*.whl --destdir %{install-root}

sources:
- kind: pypi
  name: installer
  ref:
    sha256sum: f3bd36cd261b440a88a1190b1becca0578fee90b4b62decc796932fdd5ae8839
    suffix: c9/ab/a9141dc175ec7b620fffe7e0295251a7b6a0ffb4325d64aeb128dff8c698/installer-0.6.0.tar.gz
