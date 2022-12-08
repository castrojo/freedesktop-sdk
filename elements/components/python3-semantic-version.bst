kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: semantic_version
  ref:
    sha256sum: bdabb6d336998cbb378d4b9db3a4b56a1e3235701dc05ea2690d9a997ed5041c
    suffix: 7d/31/f2289ce78b9b473d582568c234e104d2a342fd658cc288a7553d83bb8595/semantic_version-2.10.0.tar.gz
