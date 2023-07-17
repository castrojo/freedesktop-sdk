kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: distlib
  ref:
    sha256sum: 9dafe54b34a028eafd95039d5e5d4851a13734540f1331060d31c9916e7147a8
    suffix: 29/34/63be59bdf57b3a8a8dcc252ef45c40f3c018777dc8843d45dd9b869868f0/distlib-0.3.7.tar.gz
