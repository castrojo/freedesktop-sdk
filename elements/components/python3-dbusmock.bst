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
    sha256sum: 81a0ef601995889842a4549747cf017f058db2c6193d8dd8fbdc4ee57bea4941
    suffix: 
      98/8d/a16b5cac277c92fcad6887a3388faa540352de58c1068019e59067b2bcbe/python_dbusmock-0.34.1.tar.gz
