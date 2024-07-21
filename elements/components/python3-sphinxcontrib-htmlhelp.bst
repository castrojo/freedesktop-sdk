kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: sphinxcontrib-htmlhelp
  ref:
    sha256sum: c6597da06185f0e3b4dc952777a04200611ef563882e0c244d27a15ee22afa73
    suffix: 
      92/d9/a1c50c8a7b5e12f34bf4d63300a1e2629c29b71603115d900c0fa7c79219/sphinxcontrib_htmlhelp-2.0.6.tar.gz
