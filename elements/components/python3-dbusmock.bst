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
    sha256sum: dbb59e715b4d88089caed950edf93c46cb5f022ceae5d8ae37064b73baf956c1
    suffix: 
      8e/31/1328b2a3a4a43f4917208aa0a9edcac806f26184e435d0b50977d2f81fbb/python-dbusmock-0.30.0.tar.gz
