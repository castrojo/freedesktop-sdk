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
    sha256sum: 0542bc03d151f8af84f0eb0e74aa931b374b6f9c8ed8fbf7ee41989fb9d40f1d
    suffix: 
      02/dd/0faf690527478aa45131e0e0f7fb178cbd095c7856e946420f4e0fd8a9be/trove-classifiers-2023.11.9.tar.gz
