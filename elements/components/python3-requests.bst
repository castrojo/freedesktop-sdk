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
    sha256sum: f2e34a75f4749019bb0e3effb66683630e4ffeaf75819fb51bebef1bf5aef059
    suffix: 4c/d2/70fc708727b62d55bc24e43cc85f073039023212d482553d853c44e57bdb/requests-2.29.0.tar.gz
