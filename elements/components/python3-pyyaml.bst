kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst
- components/gcc.bst
- components/stripper.bst

depends:
- components/python3.bst
- components/libyaml.bst

sources:
- kind: git_repo
  url: github:yaml/pyyaml.git
  track: '*.*.*'
  exclude:
  - "*rc*"
  - "*b*"
  ref: 6.0.2-0-g41309b0bcb4559edb1d691d47199035ef539d785
