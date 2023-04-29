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
    sha256sum: 3efdb3d800386b65e8854d8ee4538764241382b4e664423ad7d959c9008dd408
    suffix: 61/da/a9a75eb38a663bdd12f4380aca6253de79c3f4dd2119a0250808a04d6bd4/python-dbusmock-0.29.0.tar.gz
