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
    sha256sum: 3b496fab84aff3936054f747e9a22bb07ac5783b1d967c6cc39536c7ba315fce
    suffix: cc/b5/0a12b2549b2e22003d49b292bf539edd482ee99cd58ab0b05dfee25074f8/python-dbusmock-0.28.6.tar.gz
