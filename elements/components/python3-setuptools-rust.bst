# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst
- components/python3-semantic-version.bst
- components/python3-setuptools.bst
- components/python3-typing-extensions.bst

sources:
- kind: git_repo
  url: github:PyO3/setuptools-rust.git
  track: v*
  ref: v1.12.1-0-g5be541f26b16b8bb6af74adb9aac790d79fafc1a
