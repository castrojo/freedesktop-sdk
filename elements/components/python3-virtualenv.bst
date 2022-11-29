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
- components/python3-importlib-metadata.bst
- components/python3-importlib-resources.bst
- components/python3-pathlib2.bst

sources:
- kind: pypi
  name: virtualenv
  ref:
    sha256sum: 7d6a8d55b2f73b617f684ee40fd85740f062e1f2e379412cb1879c7136f05902
    suffix: ac/c0/a0a0fb1433e4c3d8d9e2d6c990812e328913c64adcfbcfcae1974af0521c/virtualenv-20.17.0.tar.gz
