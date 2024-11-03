kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: async-timeout
  ref:
    sha256sum: 49675ec889daacfe65ff66d2dde7dd1447a6f4b2f23721022e4ba121f8772a85
    suffix: 
      61/1f/44d9efc904bbe4d9967433522b691a9c4f1e81c2c64fbe44bad63d5de646/async_timeout-5.0.0.tar.gz
