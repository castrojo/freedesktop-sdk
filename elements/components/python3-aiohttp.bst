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
    sha256sum: 21f8225f7dc187018e8433c9326be01477fb2810721e048b33ac49091b19fb4a
    suffix: 
      4e/05/da5ff89c85444a6ade9079e73580fb3f78c6ba0e170a2472f15400d03e02/aiohttp-3.10.8.tar.gz
