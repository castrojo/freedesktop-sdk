kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:chardet/chardet.git
  track: "5.*.*"
  ref: 5.2.0-0-gfa905b359cbcaba93a35fd6429ba9ec4b156c1c1
