kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:giampaolo/psutil.git
  track: release-*
  ref: release-7.1.3-0-g5904ff94e3fd0fea3d0734a936834bef6e63369a
