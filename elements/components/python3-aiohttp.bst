kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst
- components/python3-pkgconfig.bst

runtime-depends:
- components/python3.bst
- components/python3-aiosignal.bst
- components/python3-async-timeout.bst
- components/python3-aiohappyeyeballs.bst
- components/python3-attrs.bst
- components/python3-chardet.bst
- components/python3-multidict.bst
- components/python3-yarl.bst

sources:
- kind: pypi
  name: aiohttp
  ref:
    sha256sum: 37b1c6034a1e14764adad1829cd710543b1699d7985e1d336f0aa52a2dd76ba9
    suffix: 
      23/28/2d96dffe4deb40faa7f5615b4aa96c87528e65837d8cb5385da4aecf1c07/aiohttp-3.12.6.tar.gz
