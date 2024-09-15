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
    sha256sum: 42597e938f83bb7f3e4b35f03aa45208d49ae8d5bcb4bc10b9fc825e0ab5e423
    suffix: 
      3c/0b/7a997c8939f698d72bdea14d57116e43d3051fffb3b2964c30938c4a08e6/protobuf-5.28.1.tar.gz
