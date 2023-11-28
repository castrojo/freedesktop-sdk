kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

runtime-depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:cython/cython.git
  track: '*.*.*'
  ref-format: git-describe
  ref: 3.0.6-0-g248655889fe9ae554d12f5bb17cb61eb9878c99f
