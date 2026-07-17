# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/pkg-config.bst
- components/python3-pkgconfig.bst
- components/python3-pycparser.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3-asn1crypto.bst
- components/python3-cffi.bst
- components/python3-cryptography.bst
- components/python3-packaging.bst
- components/python3.bst
- components/tpm2-tss.bst

sources:
- kind: git_repo
  url: github:tpm2-software/tpm2-pytss.git
  track: '*.*.*'
  exclude:
  - '*a*'
  - '*b*'
  - '*rc*'
  ref: 2.3.0-0-g930cee2c45b84ac533c320b883b226edaeda9a38
- kind: patch_queue
  path: patches/python3-tpm2-pytss
