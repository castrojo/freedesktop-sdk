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
    sha256sum: 8adcc06f1eb7c495f0bdceb698bd9c044b3e57b0d5767d99ec4b6b17c9bbe957
    suffix: c8/9b/8e1a88794d21abb90349c7d0decbee3efe31b4b74987c51d815fc5784c81/trove-classifiers-2023.4.29.tar.gz
