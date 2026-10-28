# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

description: "A lightweight header-only library that exposes C++ types in Python and vice versa, mainly to create Python bindings of existing C++ code."

build-depends:
- public-stacks/buildsystem-python-scikit-build-core.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:pybind/pybind11
  track: '*.*.*'
  ref: v3.0.4-0-gd03662f0984f652b60e7ddce53d3868002275197
  provenance:
    homepage: https://pybind11.readthedocs.io/en/latest/
    issue-tracker: https://github.com/pybind/pybind11/issues
