# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

config:
  build-commands:
  - |
    mv -v LICENCE.rst python/LICENCE.rst
    %{python} -mbuild %{build-args} python

  - |
    %{python} -mbuild %{build-args} python/roman-numerals-py

  install-commands:
  - |
    for whl in %{dist-dir}/*.whl; do
      %{python} -minstaller "$whl" --destdir %{install-root}
    done

sources:
- kind: git_repo
  url: github:AA-Turner/roman-numerals.git
  track: v*
  ref: v4.1.0-0-g53c9c4eac63b91728fba3c26329163ee57654d21
