kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: zipp
  ref:
    sha256sum: 857b158da2cbf427b376da1c24fd11faecbac5a4ac7523c3607f8a01f94c2ec0
    suffix: ef/76/5a9e1553f00ee55a6de6b3c176aa4c859c7f64b9bbdc48804df174dee890/zipp-3.16.1.tar.gz
