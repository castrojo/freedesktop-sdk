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
    sha256sum: a9266644064779840feec0e34f10a89b3ff1d2d6b751fe90017abcad1864fa7c
    suffix: 
      3f/24/d5c0aed3ed90896f8505786e3a1e348fd9c61284ef21f54ee9cdf8b92e4f/aiohttp-3.11.9.tar.gz
