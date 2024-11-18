kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:esnme/ultrajson.git
  track: '*.*.*'
  ref: 5.10.0-0-g59875e089937c8b05c2f4b474530e3a9ec706a56
