kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst
- components/python3-setuptools-scm.bst

sources:
- kind: pypi
  name: tenacity
  ref:
    sha256sum: c7bb4b86425b977726a7b49971542d4f67baf72096597d283f3ffd01f33b92df
    suffix: 5a/a2/0363fd4382bd221e19dd4f3e2e420622d5f1a46f89f33aa436be035ea0c7/tenacity-8.2.1.tar.gz
