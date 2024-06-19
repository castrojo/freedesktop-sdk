kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst
- components/python3-setuptools-scm.bst

sources:
- kind: pypi
  name: tenacity
  ref:
    sha256sum: 54b1412b878ddf7e1f1577cd49527bad8cdef32421bd599beac0c6c3f10582fd
    suffix: 
      2a/19/97a822d4a556a728e6074298729ed0a35c70ecc2bcd8f5dd347829be9207/tenacity-8.4.1.tar.gz
