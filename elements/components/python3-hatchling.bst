kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst
- components/python3-editables.bst
- components/python3-packaging.bst
- components/python3-pathspec.bst
- components/python3-pluggy.bst
- components/python3-tomli.bst
- components/python3-trove-classifiers.bst

sources:
- kind: pypi
  name: hatchling
  ref:
    sha256sum: d5538779d44465879e7866f63192f63b966b255dbdae7448cac6fd1ef788ce00
    suffix: 91/a1/4def6730ad9a7ac6f201589c3389207b569d83829a0c38cea0ed14045549/hatchling-1.15.0.tar.gz
