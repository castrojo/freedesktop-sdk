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
    sha256sum: 143b0026a9dab07a05ad2dd9e46aa859bffdd6348ddc5967b42161168c24f857
    suffix: 
      14/40/f08c5d26398f987c1a27e1e351a4b461a01ffdbf9dde429c980db5286c92/aiohttp-3.10.9.tar.gz
