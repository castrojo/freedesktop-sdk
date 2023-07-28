kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst
- components/python3-dbus.bst

sources:
- kind: pypi
  name: python-dbusmock
  ref:
    sha256sum: b03590057c236d352c38973f4b71ae2c97b3a1cb1dc6f03278ce4072a3716a74
    suffix: d3/13/aa359df74782ad9a7d3f9f392b4063a1f3d568554571587d4d16aaf70044/python-dbusmock-0.29.1.tar.gz
