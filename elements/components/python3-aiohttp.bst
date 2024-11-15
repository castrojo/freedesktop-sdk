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
    sha256sum: 68d1f46f9387db3785508f5225d3acbc5825ca13d9c29f2b5cce203d5863eb79
    suffix: 
      55/68/97e4fab2add44bbd4b0107379d6900e80556c9a5d8ff548385690807b3f6/aiohttp-3.11.2.tar.gz
