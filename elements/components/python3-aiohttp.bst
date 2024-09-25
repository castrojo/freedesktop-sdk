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
    sha256sum: d2578ef941be0c2ba58f6f421a703527d08427237ed45ecb091fed6f83305336
    suffix: 
      2b/97/15c51bbfcc184bcb4d473b7b02e7b54b6978e0083556a9cd491875cf11f7/aiohttp-3.10.6.tar.gz
