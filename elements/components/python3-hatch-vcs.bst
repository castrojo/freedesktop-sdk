kind: pyproject

build-depends:
- components/python3-build.bst
- components/python3-installer.bst

depends:
- components/python3.bst
- components/python3-hatchling.bst
- components/python3-setuptools-scm.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:ofek/hatch-vcs.git
  track: v*
  ref: v0.4.0-0-ge186a8b5d97dd9c9f93ae6015139b55411d9011b
