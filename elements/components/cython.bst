kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/gcc.bst
- components/stripper.bst

runtime-depends:
- components/python3.bst

(@): include/strip.yml

sources:
- kind: git_repo
  url: github:cython/cython.git
  track: '*.*.*'
  ref-format: git-describe
  ref: 3.0.11-1-0-gc17427b59cad234fa54a1a28404c4b542077215b
