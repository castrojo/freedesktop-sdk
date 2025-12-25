kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

config:
  build-commands:
  - |
    mv -v LICENCE.rst python/LICENCE.rst
    %{python} -mbuild %{build-args} python

sources:
- kind: git_repo
  url: github:AA-Turner/roman-numerals.git
  track: v*
  ref: v4.1.0-0-g53c9c4eac63b91728fba3c26329163ee57654d21
