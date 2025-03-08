kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
# requires pypi tarball specifically
- kind: pypi
  name: protobuf
  exclude:
  - '*rc*'
  ref:
    sha256sum: 852b675d276a7d028f660da075af1841c768618f76b90af771a8e2c29e6f5965
    suffix: 
      53/6a/2629bb3529e5bdfbd6c4608ff5c7d942cd4beae85793f84ba543aab2548a/protobuf-6.30.0.tar.gz
