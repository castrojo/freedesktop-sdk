kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:ultrajson/ultrajson.git
  track: '*.*.*'
  ref: 6.1.0-0-gec958a17bf1b998812279c773b0f9e7e6982b69f
