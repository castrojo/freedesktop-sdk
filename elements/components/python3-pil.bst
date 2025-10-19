kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3-setuptools.bst
- components/jpeg.bst

sources:
- kind: git_repo
  url: github:python-pillow/Pillow.git
  track: "*.*.*"
  ref: 12.0.0-0-g693df7b42c666f88c719f9973be0ad71607328e0
