kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: zipp
  ref:
    sha256sum: a3cac813d40993596b39ea9e93a18e8a2076d5c378b8bc88ec32ab264e04ad02
    suffix: 1f/29/54ba1934c45af649698410456fa8a78a475c82efd5c562e51011079458d1/zipp-3.12.1.tar.gz
