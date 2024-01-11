kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst
- components/git-minimal.bst

depends:
- components/python3.bst

environment:
  # -march=native can be problematic and could generate binary that
  # does not work on other builders. It is also not available on
  # ppc64
  ARCHI: generic

sources:
- kind: git_repo
  url: github:Ezibenroc/PyRoaringBitMap.git
  track: refs/tags/*.*.*
  exclude:
  - '*dev*'
  ref: 0.4.5-0-g228140133bd9b40d914608aa0010e05f7d3fc536
