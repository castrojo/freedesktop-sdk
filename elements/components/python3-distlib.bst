kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:pypa/distlib.git
  track: "*.*.*"
  ref: 0.4.3-0-g3f4a377c8b164ba1c22a2a61de560f6f80ca7394
- kind: patch
  path: patches/python3-distlib/0001-Remove-upper-bound-for-setuptools-in-build-configura.patch
