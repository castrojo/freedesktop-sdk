kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pyelftools
  ref:
    sha256sum: 2fc92b0d534f8b081f58c7c370967379123d8e00984deb53c209364efd575b40
    suffix: 84/05/fd41cd647de044d1ffec90ce5aaae935126ac217f8ecb302186655284fc8/pyelftools-0.30.tar.gz
