kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:chardet/chardet.git
  track: "*.*.*"
  ref: 5.2.0-0-g78250d917a2883aa60215c04480aeb27a545f1d9
