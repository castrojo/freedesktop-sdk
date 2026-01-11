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
    sha256sum: c8794debeb402963fddff41a595e1f649bcd76616ba56c835645cab4539e810e
    suffix: cc/5c/f912bdebdd4af4160da6a2c2b1b3aaa1b8c578d0243ba8f694f93c7095f0/protobuf-6.33.3.tar.gz
