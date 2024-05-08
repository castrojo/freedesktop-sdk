kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:jd/tenacity.git
  track: '*.*.*'
  ref: 8.3.0-0-gcb15300d9b4358d9bdb6cfd33d433368700b3abe
