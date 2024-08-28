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
    sha256sum: eaa1016e353d8fc5bf08c8087e96eed15f5297aa52bb7ee1f533278bb3f3aad7
    suffix: 
      27/7b/11d9fb99c0de4075b6064fa38997ccd6e7392619c1dcba85138cd528d84c/protobuf-5.27.4.tar.gz
