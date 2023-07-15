kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: zipp
  ref:
    sha256sum: ebc15946aa78bd63458992fc81ec3b6f7b1e92d51c35e6de1c3804e73b799147
    suffix: e2/45/f3b987ad5bf9e08095c1ebe6352238be36f25dd106fde424a160061dce6d/zipp-3.16.2.tar.gz
