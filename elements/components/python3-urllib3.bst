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
  ref: 2.6.0-0-g720f484b605f18887a48eef448d0084e2b76902d
- kind: patch
  path: patches/python3-urllib3/version.patch
