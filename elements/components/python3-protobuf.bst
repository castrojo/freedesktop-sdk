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
    sha256sum: df5e5b8e39b7d1c25b186ffdf9f44f40f810bbcc9d2b71d9d3156fee5a9adf15
    suffix: 
      20/5f/00d891817d4031bbf4e846a99834bf949a76714c10a726833aa184176772/protobuf-5.27.1.tar.gz
