kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

runtime-depends:
- components/python3.bst

sources:
- kind: pypi
  name: cython
  ref:
    sha256sum: 5040764c4a4d2ce964a395da24f0d1ae58144995dab92c6b96f44c3f4d72286a
    suffix: dc/f6/e8e302f9942cbebede88b1a0c33d0be3a738c3ac37abae87254d58ffc51c/Cython-0.29.33.tar.gz
