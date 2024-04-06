kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

sources:
  # This project only has wheel in pypi so we use git
- kind: git_repo
  url: github:leohemsted/smartypants.py.git
  track: v*
  ref: v2.0.1-0-gd4b99ab7e7e6f42ba2d75624715c5c47c8de650d
