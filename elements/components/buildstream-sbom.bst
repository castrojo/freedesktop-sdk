# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

description: "A tool to produce an SBoM (Software Bill of Materials) describing a BuildStream element and its dependencies."

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

runtime-depends:
- components/askalono.bst
- components/python3-pyyaml.bst

sources:
- kind: git_repo
  url: gitlab:buildstream/buildstream-sbom.git
  track: '*.*'
  ref: 1.1-11-g186929628ce10ce5d3cc9a95924fb6b98783330b
