kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst

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
    sha256sum: b1fc6b45010a8d0ff9e88f9f2418c6fd408c99c211257334aff41597ebece42e
    suffix: 
      94/c4/3b5a937b16f6c2a0ada842a9066aad0b7a5708427d4a202a07bf09c67cbb/aiohttp-3.11.10.tar.gz
