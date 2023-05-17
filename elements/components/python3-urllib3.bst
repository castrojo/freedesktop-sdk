kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst


depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:urllib3/urllib3.git
  track: '*.*.*'
  exclude:
  - '*a*'
  - '*b*'
  - '*rc*'
  ref: 2.0.2-0-gb234aaf7ccbcb64012d8b33d21eb8bc9f768935d
