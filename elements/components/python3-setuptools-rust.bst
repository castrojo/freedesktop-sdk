# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3-semantic-version.bst
- components/python3-setuptools.bst
- components/python3-typing-extensions.bst
- components/python3.bst

sources:
- kind: git_repo
  url: github:PyO3/setuptools-rust.git
  track: v*
  ref: v1.13.0-0-ga071606b75bfa0554573d79a964aed3cf17ac6d8
