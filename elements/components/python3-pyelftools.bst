kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pyelftools
  ref:
    sha256sum: ec761596aafa16e282a31de188737e5485552469ac63b60cfcccf22263fd24ff
    suffix: 0e/35/e76da824595452a5ad07f289ea1737ca0971fc6cc7b6ee9464279be06b5e/pyelftools-0.29.tar.gz
