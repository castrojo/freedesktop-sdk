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
    sha256sum: 4359457e42708462b9626a04657c6208ad799ceb41e5c58c57ffa0e6a098a5d4
    suffix: fd/dc/0c5cfbd4df5d6e83de4e64324b370151ee88de25f3c71aea21115f4f77f8/importlib_resources-6.0.1.tar.gz
