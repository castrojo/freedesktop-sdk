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
  ref: v3.1.0-0-g97bf890db679505a14dfe547a5e77bb2bd05dc90
  provenance:
    homepage: https://pybind11.readthedocs.io/en/latest/
    issue-tracker: https://github.com/pybind/pybind11/issues
