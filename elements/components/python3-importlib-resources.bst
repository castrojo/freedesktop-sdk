kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: importlib-resources
  ref:
    sha256sum: 568c9f16cb204f9decc8d6d24a572eeea27dacbb4cee9e6b03a8025736769751
    suffix: a5/66/b844887f2225049abd75a0c54415d419e334b7a7e2a69c5a5c4968e30906/importlib_resources-5.8.0.tar.gz
