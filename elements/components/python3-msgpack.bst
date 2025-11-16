kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst

depends:
- components/python3.bst

config:
  build-commands:
    (<):
    - cython msgpack/_cmsgpack.pyx

sources:
- kind: git_repo
  url: github:msgpack/msgpack-python.git
  track: v*
  exclude:
  - "*rc*"
  ref: v1.1.2-0-g19b5d33ded09d5a563a677c1a3d75b6246181259
