# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/_private/git-minimal.bst
- components/python3-packaging.bst
- components/python3.bst

variables:
  command-subdir: vcs-versioning

sources:
- kind: git_repo
  url: github:pypa/setuptools_scm.git
  track: vcs-versioning-v*
  ref: vcs-versioning-v2.4.1-0-g41edffeffccf7aee6e2e2fe4917c8876f4549a8c
