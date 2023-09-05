kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/gcc.bst
- components/stripper.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:giampaolo/psutil.git
  track: release-*
  ref: release-6.1.0-0-gfb68f9fae3b398899d87161746884ebb2a2613c0
