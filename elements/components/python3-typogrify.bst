# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-smartypants.bst

sources:
- kind: git_repo
  url: github:mintchaos/typogrify.git
  track: '*.*.*'
  ref: 2.0.7-0-gbf9749813c72f58ca8989b737c5da4bff0fe0402
