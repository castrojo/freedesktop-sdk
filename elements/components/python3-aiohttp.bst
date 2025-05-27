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
    sha256sum: 0018956472ee535d2cad761a5bb88eb4ad80f94cd86472cee26a244799f7c79f
    suffix: 
      06/a2/a946c4f5c54233c97788c2278ea50beaadf45211f452f932b36ce322f660/aiohttp-3.12.2.tar.gz
