# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst
- components/python3-asn1crypto.bst

sources:
- kind: git_repo
  url: github:pyauth/python-pkcs11.git
  track: v*
  ref: v0.9.4-0-g0af82a36dfa87337b018873b6dd08844d30bf3dd
