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
  ref: v1.2.1-0-g448d43f5dcca7b3a2b0810e161af0a6431d90071
