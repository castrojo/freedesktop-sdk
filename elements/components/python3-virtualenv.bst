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
    sha256sum: 530b850b523c6449406dfba859d6345e48ef19b8439606c5d74d7d3c9e14d76e
    suffix: b4/27/b71df0a723d879baa0af1ad897b2498ad78f284ae668b4420092e44c05fa/virtualenv-20.16.6.tar.gz
