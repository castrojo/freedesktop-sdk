# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

runtime-depends:
- components/python3.bst
- components/python3-markupsafe.bst

sources:
- kind: git_repo
  url: github:sqlalchemy/mako.git
  track: "rel_*"
  ref: rel_1_3_12-0-gd4d1639222d2da4f18c32d11f32c37f172f603bd
  version-guess-pattern: '(\d+)_(\d+)_(\d+)'
