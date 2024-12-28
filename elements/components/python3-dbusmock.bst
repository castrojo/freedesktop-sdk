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
    sha256sum: 69c3137f15d3397846fd4aeb2e7f41289aa4c7dc2a894502225186d1fcb396ec
    suffix: 
      b6/8a/797ccdfa99340b378f65916628745ed1f093c271c99e6878df1c6cf88a66/python_dbusmock-0.34.2.tar.gz
