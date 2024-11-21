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
    sha256sum: fd9f55c1b51ae1c20a1afe7216a64a88d38afee063baa23c7fce03757023c999
    suffix: 
      d5/66/a967a2e9ceab12b6970ca5be3bccc9cf13fed4acfabe2c66de3d75599185/aiohttp-3.11.6.tar.gz
