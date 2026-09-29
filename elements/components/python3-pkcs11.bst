# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3-asn1crypto.bst
- components/python3.bst

sources:
- kind: git_repo
  url: github:pyauth/python-pkcs11.git
  track: v*
  ref: v0.10.0-0-g2b031329ca087852e94db3ebf6f6672846040afa
