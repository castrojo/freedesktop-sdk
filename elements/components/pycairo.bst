kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- components/cairo.bst
- components/python3.bst

sources:
- kind: pypi
  name: pycairo
  ref:
    sha256sum: 37842b9bfa6339c45a5025f752e1d78d5840b1a0f82303bdd5610846ad8b5c4f
    suffix: db/f1/45f288a45215e12dea5a107a2e686e33902701d5485219437b5d64d1080a/pycairo-1.25.0.tar.gz
