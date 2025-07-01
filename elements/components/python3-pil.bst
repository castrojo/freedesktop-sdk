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
  ref: 11.3.0-0-g89f1f4626a2aaf5f3d5ca6437f41def2998fbe09
