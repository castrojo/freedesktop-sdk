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
    sha256sum: a3a9034e4902772431c1efa111f83367be5052441a245e465e78ec38c795c2c9
    suffix: 69/be/3500c501317f61cc76b5b67b3d79a8ea5f804ab322411434bf4ee2408ec5/trove-classifiers-2023.4.25.tar.gz
