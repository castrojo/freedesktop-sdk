kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst
- components/python3-zipp.bst

sources:
- kind: pypi
  name: importlib-metadata
  ref:
    sha256sum: 5a66966b39ff1c14ef5b2d60c1d842b0141fefff0f4cc6365b4bc9446c652807
    suffix: 4b/fd/ea3ca048abb8534a847c3e5f59f6701a4eb1fd124556b14edeb506ec8986/importlib_metadata-6.2.1.tar.gz
