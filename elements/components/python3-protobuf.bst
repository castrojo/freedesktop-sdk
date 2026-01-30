kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

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
    sha256sum: 6ddcac2a081f8b7b9642c09406bc6a4290128fce5f471cddd165960bb9119e5c
    suffix: ba/25/7c72c307aafc96fa87062aa6291d9f7c94836e43214d43722e86037aac02/protobuf-6.33.5.tar.gz
