kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:shibukawa/imagesize_py.git
  track: "*.*.*"
  ref: 1.4.1-0-g8d88ec6b646d6184b5633604551d6fc154783073
