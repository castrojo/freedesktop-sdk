kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:giampaolo/psutil.git
  track: release-*
  ref: release-7.2.0-0-g704e218db7da14e98a54f2aa9f93372d5900e0b4
