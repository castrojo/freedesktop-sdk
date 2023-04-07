kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-calver.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:pypa/trove-classifiers.git
  track: '*.*.*'
  ref: 2023.3.9-0-g1d9c2fea820ec8d9c274248294871cbf5dba3511
