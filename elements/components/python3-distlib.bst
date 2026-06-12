kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:pypa/distlib.git
  track: "*.*.*"
  ref: 0.4.2-0-g8183ea60e83bf021bf7d6903f4a6b3c8df0905a6
- kind: patch
  path: patches/python3-distlib/0001-Remove-upper-bound-for-setuptools-in-build-configura.patch
