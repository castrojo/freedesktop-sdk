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
    sha256sum: f02c34493d420b3cf2d8d341b79a60841593b7b7615adc3ece17ff86f8275924
    suffix: 
      15/fc/e8b8e1e887a011685b71e9d61dcfbf05cdbd720878922e80ed5000798788/python-dbusmock-0.32.1.tar.gz
