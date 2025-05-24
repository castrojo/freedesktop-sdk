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
    sha256sum: 8651c2074d117cc84bf3ca7f0a648c215363b763761f2a8d79bc4ace5a1b3ae9
    suffix: 
      30/31/ee9fac5ad7c33f36420d1bda7d1502ed56f7885dddf87726618c30c48073/python_dbusmock-0.35.0.tar.gz
