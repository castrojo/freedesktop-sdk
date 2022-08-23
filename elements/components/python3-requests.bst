kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-urllib3.bst
- components/python3-certifi.bst
- components/python3-idna.bst
- components/python3-chardet.bst
- components/python3-charset-normalizer.bst

sources:
- kind: pypi
  name: requests
  ref:
    sha256sum: d568723a7ebd25875d8d1eaf5dfa068cd2fc8194b2e483d7b1f7c81918dbec6b
    suffix: e9/23/384d9953bb968731212dc37af87cb75a885dc48e0615bd6a303577c4dc4b/requests-2.28.0.tar.gz
