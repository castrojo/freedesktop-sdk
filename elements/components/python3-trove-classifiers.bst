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
    sha256sum: bfdfe60bbf64985c524416afb637ecc79c558e0beb4b7f52b0039e01044b0229
    suffix: 
      c2/d3/2c793df6cea96eda294daa400e4b6f06cd75b7a65005eb2c84aae2d08c5c/trove-classifiers-2024.1.31.tar.gz
