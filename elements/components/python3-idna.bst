kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:kjd/idna.git
  track: v*
  ref: v3.18-0-gf39ea903ba49eb5a0b2c6723c9a929b41ed4a0f1
