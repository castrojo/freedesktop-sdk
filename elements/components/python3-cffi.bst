kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/pkg-config.bst

depends:
- components/libffi.bst
- components/python3.bst
- components/python3-pycparser.bst

sources:
- kind: pypi
  name: cffi
  exclude:
  # cffi-1.0.2-2.tar.gz gets parsed as version 2 by packaging as non-canonical format
  - '2'
  ref:
    sha256sum: bcb3ef43e58665bbda2fb198698fcae6776483e0c4a631aa5647806c25e02cc0
    suffix: 
      68/ce/95b0bae7968c65473e1298efb042e10cafc7bafc14d9e4f154008241c91d/cffi-1.16.0.tar.gz
