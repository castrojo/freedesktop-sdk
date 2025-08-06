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
  ref: 2.5.0-0-gaaab4eccc10c965897540b21e15f11859d0b62e7
- kind: patch
  path: patches/python3-urllib3/setuptools_scm_version.patch
