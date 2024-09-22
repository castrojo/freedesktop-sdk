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
    sha256sum: 4b46b3e134a4d01999ac5bc6e528afcc10cc48f0f724f185f267e276005768f4
    suffix: 
      16/14/55ceb59dabf95f554b5368fdabe8d370165a25f817a23d809ad6c87a0b06/trove_classifiers-2024.9.12.tar.gz
