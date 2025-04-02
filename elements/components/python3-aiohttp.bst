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
    sha256sum: b9b9a1e592ac8fcc4584baea240e41f77415e0de98932fdf19565aa3b6a02d0b
    suffix: 
      19/18/31398875dc7b9815767370f60f44284155f2e1c1b87ec721c1b0ee61d1e5/aiohttp-3.11.15.tar.gz
