# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

description: "Python module for Nftables bindings"

(@):
- elements/include/nftables.yml

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/nftables.bst
- components/python3.bst

variables:
  command-subdir: py
