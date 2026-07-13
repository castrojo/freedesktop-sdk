# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-jinja2.bst
- components/python3-markdown.bst
- components/python3-markupsafe.bst
- components/python3-packaging.bst
- components/python3-pygments.bst
- components/python3-typogrify.bst

sources:
- kind: git_repo
  url: gnome:gi-docgen.git
  track: '*.*'
  ref-format: git-describe
  ref: 2026.1-0-g3142afb34f5dee4889c92d3bc8ec2bd2aabb90b7
