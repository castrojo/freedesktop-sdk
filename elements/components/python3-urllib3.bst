kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst

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
  ref: 2.6.2-0-g83f8643ffb5b7f197457379148e2fa118ab0fcdc
- kind: patch
  path: patches/python3-urllib3/version.patch
