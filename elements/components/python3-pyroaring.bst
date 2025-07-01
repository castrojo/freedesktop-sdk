kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython-3.bst
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
    sha256sum: aa4a1de882bf4a245c7c0dee8594b898e76501bc32afc0cc9ff4138784462839
    suffix: 
      2a/b2/5e0ab902f3899ba8a3e2bc3d901a9c66a902d5e5344c46900165ce506636/pyroaring-1.0.2.tar.gz
- kind: patch
  path: patches/python3-pyroaring/relax-cython.patch
