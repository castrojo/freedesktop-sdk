# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- components/python3-build.bst
- components/python3-installer.bst
- components/python3-setuptools.bst

depends:
- components/fakecap.bst
- components/python3-pyyaml.bst

variables:
  strip-binaries: ''

sources:
- kind: local
  path: files/oci
