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
    sha256sum: 23a5f97e7dd22e181967fb6cb6c3b11653b0fdbbc4bb7739d9b6052890ccab96
    suffix: 
      80/5e/42678cd8af232a01441b375b963a6c79943718a0cb9da90ab7e5ff14f1d3/aiohttp-3.10.4.tar.gz
