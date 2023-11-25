kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst


sources:
- kind: pypi
  name: idna
  ref:
    sha256sum: 27009fe2735bf8723353582d48575b23c533cc2c2de7b5a68908d91b5eb18d08
    suffix: 
      9b/c4/db3e4b22ebc18ee797dae8e14b5db68e5826ae6337334c276f1cb4ff84fb/idna-3.5.tar.gz
