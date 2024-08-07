kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/cython.bst

depends:
- components/python3.bst
- components/libyaml.bst

sources:
- kind: pypi
  name: pyyaml
  ref:
    sha256sum: d584d9ec91ad65861cc08d42e834324ef890a082e591037abe114850ff7bbc3e
    suffix: 
      54/ed/79a089b6be93607fa5cdaedf301d7dfb23af5f25c398d5ead2525b063e17/pyyaml-6.0.2.tar.gz
