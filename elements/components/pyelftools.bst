kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:eliben/pyelftools
  track: 'v*.*'
  ref: v0.31-0-gff0118701a091ea9cbf3b44c65046754e3c77156
