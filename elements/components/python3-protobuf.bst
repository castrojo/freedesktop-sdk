kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/gcc.bst
- components/stripper.bst

depends:
- components/python3.bst

sources:
# requires pypi tarball specifically
- kind: pypi
  name: protobuf
  exclude:
  - '*rc*'
  ref:
    sha256sum: 59379674ff119717404f7454647913787034f03fe7049cbef1d74a97bb4593f0
    suffix: 
      b1/a4/4579a61de526e19005ceeb93e478b61d77aa38c8a85ad958ff16a9906549/protobuf-5.28.2.tar.gz
