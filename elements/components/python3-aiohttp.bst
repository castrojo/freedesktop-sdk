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
    sha256sum: edea7d15772ceeb29db4aff55e482d4bcfb6ae160ce144f2682de02f6d693551
    suffix: 
      04/a4/e3679773ea7eb5b37a2c998e25b017cc5349edf6ba2739d1f32855cfb11b/aiohttp-3.9.5.tar.gz
