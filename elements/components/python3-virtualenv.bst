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
    sha256sum: 4c44b1d77ca81f8368e2d7414f9b20c428ad16b343ac6d226206c5b84e2b4fcc
    suffix: b8/5c/c6acf0fb35c2e830114a81ae771599e0dd11b5905f2386782fa2793ec6c8/virtualenv-20.15.0.tar.gz
