kind: pyproject

(@):
- include/_private/python-setuptools-recc.yml

depends:
- components/python3.bst

variables:
# https://gitlab.com/freedesktop-sdk/freedesktop-sdk/-/issues/1913
  (?):
  - target_arch == "aarch64":
      local_flags: -mbranch-protection=none

sources:
# requires pypi tarball specifically
- kind: pypi
  name: protobuf
  exclude:
  - '*rc*'
  ref:
    sha256sum: 9ce42245e704cc5027be797c1db1eb93184d44d1cdd71811fb2d9b25ad541280
    suffix: 6b/6b/a0e95cad1ad7cc3f2c6821fcab91671bd5b78bd42afb357bb4765f29bc41/protobuf-7.34.1.tar.gz
