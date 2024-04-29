kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-calver.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: trove-classifiers
  ref:
    sha256sum: 49f40bb6a746b72a1cba4f8d55ee8252169cda0f70802e3fd24f04b7fb25a492
    suffix: 
      73/e9/b732ae50ebe5e4949bb20a47243d9fee6f3c15027c3f8ffeaa0982e68173/trove-classifiers-2024.4.10.tar.gz
