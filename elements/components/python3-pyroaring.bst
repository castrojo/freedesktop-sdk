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
- kind: pypi
  name: pyroaring
  ref:
    sha256sum: 816c93baa5c729ff906056ffedf723c9cddaf1ea988a882e0ec5062ae9ea673c
    suffix: 
      a4/c7/4291bbd2e32640fe1327bb75790ff5d90485a6c5f20eeea45d2ea06f9edb/pyroaring-0.4.5.tar.gz
