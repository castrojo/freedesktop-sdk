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
    sha256sum: 4fc61385e9c98d72fcdf47e6dd81833f47b2f77c114c29cd64a361be57a763a2
    suffix: 
      9b/e7/d92a237d8802ca88483906c388f7c201bbe96cd80a165ffd0ac2f6a8d59f/aiohttp-3.12.15.tar.gz
