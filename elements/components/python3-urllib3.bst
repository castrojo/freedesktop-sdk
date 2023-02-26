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
  ref: 1.26.14-0-gf96a1cfc568beddf1e17ce7609609eca40780be5
