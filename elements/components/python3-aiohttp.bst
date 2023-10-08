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
    sha256sum: b0cf2a4501bff9330a8a5248b4ce951851e415bdcce9dc158e76cfd55e15085c
    suffix: fd/01/f180d31923751fd20185c96938994823f00918ee5ac7b058edc005382406/aiohttp-3.8.6.tar.gz
