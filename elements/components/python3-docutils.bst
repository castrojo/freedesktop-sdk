kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- filename: components/python3.bst

sources:
- kind: pypi
  name: docutils
  ref:
    sha256sum: 33995a6753c30b7f577febfc2c50411fec6aac7f7ffeb7c4cfe5991072dcf9e6
    suffix: 6b/5c/330ea8d383eb2ce973df34d1239b3b21e91cd8c865d21ff82902d952f91f/docutils-0.19.tar.gz
