kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:erocarrera/pefile
  track: v*
  ref: v2023.2.7-0-g1ab2807c4eec16041e791d7a6acc68cc23fd5266
