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
    sha256sum: 2c9914c8914ff40b68c6e4ed5da33e88d4e8f368fddd03ceb0eb3175905ca782
    suffix: 
      4b/ad/5b0f3451c2275af09966f1d7c0965facd4729a5b7efdc2eb728654679f85/aiohttp-3.12.9.tar.gz
