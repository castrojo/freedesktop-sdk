kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: charset-normalizer
  ref:
    sha256sum: ebea339af930f8ca5d7a699b921106c6e29c617fe9606fa7baa043c1cdae326f
    suffix: 96/d7/1675d9089a1f4677df5eb29c3f8b064aa1e70c1251a0a8a127803158942d/charset-normalizer-3.0.1.tar.gz
