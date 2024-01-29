kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst

runtime-depends:
- components/python3.bst
- components/python3-aiosignal.bst
- components/python3-async-timeout.bst
- components/python3-attrs.bst
- components/python3-chardet.bst
- components/python3-multidict.bst
- components/python3-yarl.bst

sources:
- kind: pypi
  name: aiohttp
  ref:
    sha256sum: b0ad0a5e86ce73f5368a164c10ada10504bf91869c05ab75d982c6048217fbf7
    suffix: 
      07/2f/27c9ae85646de72784529a86d2a98c7cfae4ff9eab0004becf47da66c7ec/aiohttp-3.9.2.tar.gz
