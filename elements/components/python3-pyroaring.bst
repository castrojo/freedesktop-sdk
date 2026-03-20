kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst
- components/_private/git-minimal.bst

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
  ref: 1.0.4-0-g703a842a211dd551509c9e7846c256960e7fa27f
