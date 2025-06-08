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
    sha256sum: a5149ae1b11ce4cf8b122846bfa3d7c5f29fe3bfe6745ab21b3eea9615bc5564
    suffix: 
      93/6b/850a842871ab7be0d00686750d0ee9d8fb8e7be981e4e5700bb6c88f1b8f/aiohttp-3.12.11.tar.gz
