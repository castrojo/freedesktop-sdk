kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst
- components/gcc.bst
- components/stripper.bst

depends:
- components/python3.bst

(@): include/strip.yml

sources:
- kind: git_repo
  url: github:aio-libs/multidict.git
  track: v*
  exclude:
  - "*a*"
  ref: v6.1.0-0-g4140e63780dc6dd600a1837cb9b4c5198c3dcd68
