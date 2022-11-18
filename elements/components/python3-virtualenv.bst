kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-appdirs.bst
- components/python3-distlib.bst
- components/python3-filelock.bst
- components/python3-six.bst
- components/python3-pathlib2.bst

sources:
- kind: pypi
  name: virtualenv
  ref:
    sha256sum: 8691e3ff9387f743e00f6bb20f70121f5e4f596cae754531f2b3b3a1b1ac696e
    suffix: 2b/dc/be4da7a7fea4e8c3612a4f1901efc694b4f5f1c30179518ffef88c5f8dde/virtualenv-20.16.7.tar.gz
