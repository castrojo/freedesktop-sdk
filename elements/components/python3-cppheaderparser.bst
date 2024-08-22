kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst
- components/python3-ply.bst

sources:
- kind: pypi
  name: CppHeaderParser
  ref:
    sha256sum: 382b30416d95b0a5e8502b214810dcac2a56432917e2651447d3abe253e3cc42
    suffix: 
      3c/ba/d8d168a4b54cae66eaf13d1d9197ca9349c94653815e061f79e7eed86c01/CppHeaderParser-2.7.4.tar.gz
