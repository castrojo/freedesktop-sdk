kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst
- components/cython.bst
- components/python3-wheel.bst

runtime-depends:
- components/python3-async-timeout.bst
- components/python3-attrs.bst
- components/python3-chardet.bst
- components/python3-multidict.bst
- components/python3-yarl.bst

sources:
- kind: pypi
  name: aiohttp
  ref:
    sha256sum: 09f23292d29135025e19e8ff4f0a68df078fe4ee013bca0105b2e803989de92d
    suffix: 
      71/80/68f3bd93240efd92e9397947301efb76461db48c5ac80be2423ffa9c20a3/aiohttp-3.9.0.tar.gz
