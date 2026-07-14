# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/_private/git-minimal.bst
- components/python3-packaging.bst
- components/python3-setuptools.bst
- components/python3-vcs-versioning.bst
- components/python3.bst

variables:
  command-subdir: setuptools-scm

sources:
- kind: git_repo
  url: github:pypa/setuptools_scm.git
  track: setuptools-scm-v*
  exclude:
  - "*dev*"
  - "*vcs-*"
  ref: setuptools-scm-v10.2.0-0-ga70589150e28f43aded5852eed09765f69bfff66
