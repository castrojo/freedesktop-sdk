kind: pip

build-depends:
- components/python3-pip.bst
- public-stacks/buildsystem-autotools.bst

depends:
- components/python3.bst
- components/libdbus.bst
- components/glib.bst

sources:
- kind: pypi
  name: dbus-python
  ref:
    sha256sum: 92bdd1e68b45596c833307a5ff4b217ee6929a1502f5341bae28fd120acf7260
    suffix: b1/5c/ccfc167485806c1936f7d3ba97db6c448d0089c5746ba105b6eb22dba60e/dbus-python-1.2.18.tar.gz
