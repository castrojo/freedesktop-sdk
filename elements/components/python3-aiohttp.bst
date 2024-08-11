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
    sha256sum: 21650e7032cc2d31fc23d353d7123e771354f2a3d5b05a5647fc30fea214e696
    suffix: 
      15/9c/ed427fcc46423c965a8e33673d7111b6e3b3aa7d61ca52163a720ff200cb/aiohttp-3.10.3.tar.gz
