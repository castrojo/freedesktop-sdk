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
  ref: vcs-versioning-v2.3.2-0-g96956beffad7d0b2fc324b5e33b3a5e409aa1a0c
