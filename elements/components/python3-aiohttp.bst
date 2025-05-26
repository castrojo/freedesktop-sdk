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
    sha256sum: e3f0a2b4d7fb16c0d584d9b8860f1e46d39f7d93372b25a6f80c10015a7acdab
    suffix: 
      6a/61/d37b33a074ad867d1ecec9f03183e2b9fee067745cae17e73c264f556d57/aiohttp-3.12.0.tar.gz
