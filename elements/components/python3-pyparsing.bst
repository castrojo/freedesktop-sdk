kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pyparsing
  ref:
    sha256sum: fff89494f45559d0f2ce46613b419f632bbb6afbdaed49696d322bcf98a58e99
    suffix: 
      98/c9/b4594e6a81371dfa9eb7a2c110ad682acf985d96115ae8b25a1d63b4bf3b/pyparsing-3.2.4.tar.gz
