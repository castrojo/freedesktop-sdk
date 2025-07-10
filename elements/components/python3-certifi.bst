kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: certifi
  ref:
    sha256sum: c1d2ec05395148ee10cf672ffc28cd37ea0ab0d99f9cc74c43e588cbd111b079
    suffix: 
      de/8a/c729b6b60c66a38f590c4e774decc4b2ec7b0576be8f1aa984a53ffa812a/certifi-2025.7.9.tar.gz
