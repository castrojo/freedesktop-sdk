kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: sphinxcontrib-serializinghtml
  ref:
    sha256sum: e04d06ac23c527378d62459ec968204afce0ef266733209d628b9a1a4051a78d
    suffix: 59/f9/16f06052461ae581e39936ae20179256afc092335b1571a04dba691ae401/sphinxcontrib_serializinghtml-1.1.6.tar.gz
