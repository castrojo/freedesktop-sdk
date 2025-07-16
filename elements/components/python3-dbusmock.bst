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
    sha256sum: 2d3812ee6c1e15607bca882ed5dfcabaac449c1a3b9627080bbab3deefd56fd2
    suffix: 
      a1/58/a3994e328b33e4cfa6ea9b6213c1ddff2fffdd6b342560fe92a400ab9eaf/python_dbusmock-0.36.0.tar.gz
