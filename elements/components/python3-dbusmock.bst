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
    sha256sum: 0786977750dbcbde6e2553339a2e66d9a8d4453d5c848b945e8fd1badb736ffd
    suffix: c2/69/5d31a5c186a78bd0887d0ac81556d8a1d89b9ee4fed6cf046978dcdc51a3/python-dbusmock-0.28.7.tar.gz
