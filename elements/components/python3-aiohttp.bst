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
    sha256sum: 01a8aca4af3da85cea5c90141d23f4b0eee3cbecfd33b029a45a80f28c66c668
    suffix: 
      4b/cb/f9bb10e0cf6f01730b27d370b10cc15822bea4395acd687abc8cc5fed3ed/aiohttp-3.11.7.tar.gz
