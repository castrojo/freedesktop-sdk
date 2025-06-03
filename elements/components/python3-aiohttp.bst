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
    sha256sum: 08bf55b216c779eddb6e41c1841c17d7ddd12776c7d7b36051c0a292a9ca828e
    suffix: 
      eb/62/95588e933dfea06a3af0332990bd19f6768f8f37fa4c0fe33fe4c55cf9d0/aiohttp-3.12.7.tar.gz
