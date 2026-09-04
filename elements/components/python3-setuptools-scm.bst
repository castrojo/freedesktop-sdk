# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/git.bst
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
  ref: setuptools-scm-v10.2.1-0-gac108b243380c10de77de32eb696b74d5f5eb63f
- kind: patch
  path: patches/setuptools-scm/0001-Improve-reproducibility-of-scm_list.patch
