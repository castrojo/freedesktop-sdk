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
    sha256sum: edb662d6fe322d6e990b1594b5feaeadf806803359e3d4d42f11e295e588f0ea
    suffix: 4f/13/28e88033cab976721512e7741000fb0635fa078045e530a91abb25aea0c0/pyparsing-3.1.0.tar.gz
