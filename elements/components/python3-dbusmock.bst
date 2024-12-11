kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

runtime-depends:
- components/python3.bst
- components/python3-dbus.bst

sources:
- kind: pypi
  name: python-dbusmock
  ref:
    sha256sum: 04efd311dd1063ac2b8f7baa79a026b5c0aa3ed4ef18cd9226f52a273fa6193a
    suffix: 
      31/94/96f76e84e909222f54b4a9fe6c45bce8409c5916e5d45d27c536df4d92be/python-dbusmock-0.33.0.tar.gz
