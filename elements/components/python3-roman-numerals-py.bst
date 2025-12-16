kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

config:
  build-commands:
  - |
    mv -v LICENCE.rst python/LICENCE.rst
    %{python} -mbuild %{build-args} python

sources:
- kind: git_repo
  url: github:AA-Turner/roman-numerals.git
  track: v*
  ref: v4.0.0-0-gc3e1b6b4e6e02e5e19c26dc6f72bbb7b1060cca5
