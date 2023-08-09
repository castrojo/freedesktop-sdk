kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: sphinxcontrib-qthelp
  ref:
    sha256sum: f0a1c141420499af2f1a1ff438f9fc910a3548f7a82a1169d9efcc674fcf79c6
    suffix: c6/be/8b88f8fa7f9cad60f1543f558ddd46dd43d044ba2babea06ec67891e64d3/sphinxcontrib_qthelp-1.0.4.tar.gz
