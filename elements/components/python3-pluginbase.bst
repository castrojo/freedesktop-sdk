# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:mitsuhiko/pluginbase.git
  track: v*
  ref: v1.0.1-0-g2a5db4c0bba11dc6dff0110c298e3ab9d8521532
