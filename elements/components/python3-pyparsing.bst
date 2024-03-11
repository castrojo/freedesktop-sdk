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
    sha256sum: a1bac0ce561155ecc3ed78ca94d3c9378656ad4c94c1270de543f621420f94ad
    suffix: 
      46/3a/31fd28064d016a2182584d579e033ec95b809d8e220e74c4af6f0f2e8842/pyparsing-3.1.2.tar.gz
