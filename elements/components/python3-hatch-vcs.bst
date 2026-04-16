kind: pyproject

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
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
  ref: v0.5.0-0-gdfec2c06defdb4648eb66f6aadf7b57453d732cd
