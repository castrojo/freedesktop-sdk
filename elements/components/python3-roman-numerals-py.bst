kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

config:
  build-commands:
  - |
    %{python} -mbuild %{build-args} python

sources:
- kind: git_repo
  url: github:AA-Turner/roman-numerals.git
  track: v*
  ref: v3.0.0-0-g6727a2c61cf03026c2ae76f12e01485604a6a8d9
