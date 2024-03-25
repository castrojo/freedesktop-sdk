kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pyelftools
  ref:
    sha256sum: c774416b10310156879443b81187d182d8d9ee499660380e645918b50bc88f99
    suffix: 
      88/56/0f2d69ed9a0060da009f672ddec8a71c041d098a66f6b1d80264bf6bbdc0/pyelftools-0.31.tar.gz
