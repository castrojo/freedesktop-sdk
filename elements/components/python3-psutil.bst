kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:giampaolo/psutil.git
  track: release-*
  ref: release-5.9.5-0-g0d4900b073f8697ab21c47d823621bea61f39a3b
