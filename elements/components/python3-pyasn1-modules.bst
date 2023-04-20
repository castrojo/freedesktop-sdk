kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-pyasn1.bst

sources:
- kind: pypi
  name: pyasn1-modules
  ref:
    sha256sum: 5bd01446b736eb9d31512a30d46c1ac3395d676c6f3cafa4c03eb54b9925631c
    suffix: 3b/e4/7dec823b1b5603c5b3c51e942d5d9e65efd6ff946e713a325ed4146d070f/pyasn1_modules-0.3.0.tar.gz
