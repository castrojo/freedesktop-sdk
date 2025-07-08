kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython3-0.bst
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
  ref: 1.0.2-0-g369daeb212ad69b4cf68e05b7c632fd2b9473e49
