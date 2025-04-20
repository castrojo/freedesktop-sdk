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
    sha256sum: 2bf3ff374c3abd7a5c6c8de3ad7ed91e0e89a8b53353314c93766c3add5a208a
    suffix: 
      b0/55/9840882e8b8f83014169646638d985ba2a2b55983f6d1f4246a050221373/aiohttp-3.11.17.tar.gz
