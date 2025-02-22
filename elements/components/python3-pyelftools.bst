kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pyelftools
  ref:
    sha256sum: 6de90ee7b8263e740c8715a925382d4099b354f29ac48ea40d840cf7aa14ace5
    suffix: 
      b9/ab/33968940b2deb3d92f5b146bc6d4009a5f95d1d06c148ea2f9ee965071af/pyelftools-0.32.tar.gz
