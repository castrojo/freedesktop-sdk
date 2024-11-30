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
    sha256sum: 7bc9d64a2350cbb29a9732334e1a0743cbb6844de1731cbdf5949b235653f3fd
    suffix: 
      2c/e5/c7ad0689e8ab74c3ec9bf20e0f667e1278b3738ae19ae3fed21e6a0543ca/aiohttp-3.11.8.tar.gz
