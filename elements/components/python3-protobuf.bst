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
    sha256sum: 3871a3df67c710aaf7bb8d214cc997342e63ceebd940c8c7fc65c9b3d697591a
    suffix: f2/00/04a2ab36b70a52d0356852979e08b44edde0435f2115dc66e25f2100f3ab/protobuf-7.34.0.tar.gz
