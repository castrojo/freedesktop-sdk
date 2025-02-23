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
    sha256sum: 439127291ec4364cbe3c2f58c47987bbe189e9493ccc6d56629bd484e79a6f8b
    suffix: 
      54/02/ec6c7982d80c5c9e6d1beb445ca0a928bc945670e50b8b5a9cd1075b4f84/python_dbusmock-0.34.3.tar.gz
