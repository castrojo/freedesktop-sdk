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
    sha256sum: c01b1b94210d9849f286b86bb51bcea7cd56dde0600d8db721d7b81330711668
    suffix: 06/72/6bf0df4fe7a139147f5d6b473f16d5aefb7bc5b719ba5dd33f230d35760f/importlib_resources-5.10.0.tar.gz
