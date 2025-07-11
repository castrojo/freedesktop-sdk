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
    sha256sum: 6e06e120e34d93100de448fd941522e11dafa78ef1a893c179901b7d66aa29f2
    suffix: 
      e6/0b/e39ad954107ebf213a2325038a3e7a506be3d98e1435e1f82086eec4cde2/aiohttp-3.12.14.tar.gz
