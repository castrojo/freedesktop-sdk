kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:pypa/distlib.git
  track: "*.*.*"
  ref: 0.4.1-0-gd562ad5aabe23dc03b22fccdf84dc01fddf0d336
- kind: patch
  path: patches/python3-distlib/0001-Remove-upper-bound-for-setuptools-in-build-configura.patch
