kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: charset-normalizer
  ref:
    sha256sum: 5baececa9ecba31eff645232d59845c07aa030f0c81ee70184a90d35099a0e63
    suffix: 
      e4/33/89c2ced2b67d1c2a61c19c6751aa8902d46ce3dacb23600a283619f5a12d/charset_normalizer-3.4.2.tar.gz
- kind: patch
  path: patches/python3-charset-normalizer/rm-mypy.patch
