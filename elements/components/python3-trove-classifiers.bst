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
    sha256sum: 9fbc0db7e6f80471cd3b9fc29a63c10a19c16089b771c8ea87a005e92e8dc114
    suffix: f1/11/510639e751169550c933c98cba5947415301879e62fde97239d94cedad8c/trove-classifiers-2023.4.20.tar.gz
