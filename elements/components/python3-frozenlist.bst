kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst
- components/python3-expandvars.bst
- components/gcc.bst
- components/stripper.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:aio-libs/frozenlist.git
  track: "*.*.*"
  exclude:
  - "*a*"
  ref: v1.5.0-0-g91991e39d37700f4200a11cb24f6318872aac971
