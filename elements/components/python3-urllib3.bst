kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:urllib3/urllib3.git
  track: '*.*.*'
  exclude:
  - '*a*'
  - '*b*'
  - '*rc*'
  ref: 2.6.3-0-g0248277dd7ac0239204889ca991353ad3e3a1ddc
- kind: patch
  path: patches/python3-urllib3/version.patch
- kind: patch
  path: patches/python3-urllib3/setuptools_scm_version.patch
