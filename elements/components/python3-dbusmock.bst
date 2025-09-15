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
    sha256sum: 38754c5ad2ad8f3936ff67d4b058bca416588a72bc094e91ded9f8f401b06310
    suffix: 
      48/65/0ab72f93b9bf60e04ca968d6224e646f04f8a8aa250e3214cbdefa8f6fbe/python_dbusmock-0.37.0.tar.gz
