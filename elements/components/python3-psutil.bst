kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:giampaolo/psutil.git
  track: release-*
  ref: release-7.1.2-0-gc948ef07e46b114a61492c9d207c741339fceeb2
