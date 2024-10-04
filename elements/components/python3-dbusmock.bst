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
    sha256sum: 357c269d53a5bb3f87983bec7ff700a0c4d071481f7cf7221ec8376224fc4316
    suffix: 
      d2/b1/240ad35502c356f9f6e30ca246b66df6ff44b01a115920da27bf7a8d4ea7/python-dbusmock-0.32.2.tar.gz
