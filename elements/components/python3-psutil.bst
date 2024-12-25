kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:giampaolo/psutil.git
  track: release-*
  ref: release-6.1.1-0-g58552f6aa9f7dfb964596e28519ad77b8374defd
