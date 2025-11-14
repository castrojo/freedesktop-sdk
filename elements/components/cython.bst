kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

runtime-depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:cython/cython.git
  track: '*.*.*'
  exclude:
  - "*a*"
  - "*rc*"
  - "*b*"
  ref: 3.2.1-0-g91685b68e8efc249863b50cd6b6d6bf2d4a9e285
