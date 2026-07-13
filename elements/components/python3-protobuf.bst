# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

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
    sha256sum: ce115a26fe0c39a2c29973d914d327e516a6455464489fe3cd1e51a1b354f81a
    suffix: da/01/9ef0afd7999eb9badb3a768b4aedd78c86d4c65cfaf1958ab276199e76b4/protobuf-7.35.1.tar.gz
