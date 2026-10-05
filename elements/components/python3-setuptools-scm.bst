# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/_private/git-minimal.bst

depends:
- components/python3-setuptools.bst
- components/python3-vcs-versioning.bst
- components/python3.bst

runtime-depends:
- components/python3-packaging.bst

variables:
  command-subdir: setuptools-scm

sources:
- kind: git_repo
  url: github:pypa/setuptools_scm.git
  track: setuptools-scm-v*
  exclude:
  - "*dev*"
  - "*vcs-*"
  ref: setuptools-scm-v10.3.4-0-gb27f5973c4e24cdbca08f8c003e431e220f52a40
