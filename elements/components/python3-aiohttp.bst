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
    sha256sum: 18c72a69ba20713f26fa40932cac17437b0c1d25edff2e27437a204c12275bd9
    suffix: 
      ad/8a/c574246bbd2eaa0fb602bcb684196aed6e846c8e2000f4497fa75164976d/aiohttp-3.10.7.tar.gz
