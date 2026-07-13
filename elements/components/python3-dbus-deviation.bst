# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/_private/git-minimal.bst
- components/python3-setuptools-git.bst
- components/python3-sphinx.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-lxml.bst

sources:
- kind: git_repo
  url: github:pwithnall/dbus-deviation.git
  track: "*.*.*"
  ref: 0.6.1-0-g25cd79d2122dee8ce499357974b57a0af5207cd7
