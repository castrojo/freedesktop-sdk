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
    sha256sum: 07f2b9a15255e3cf3f137d884af7972407b556a7a220912b252f26dc3121e6bf
    suffix: 
      73/cb/8d83e166a822d893c2c07ef4a57598873634b65a68153ca62b6ba85f67b9/protobuf-5.27.0.tar.gz
