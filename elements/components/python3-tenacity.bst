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
  ref: 9.1.3-0-g24415ebbca6ecafdf870af06441656dd96149d1d
