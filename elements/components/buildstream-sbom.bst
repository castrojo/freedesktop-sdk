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
  ref: 1.2-0-g62d94f4c138cd4b926eef9d988fda008275dc9e7
