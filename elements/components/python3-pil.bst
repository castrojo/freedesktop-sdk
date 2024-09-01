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
  ref: 10.4.0-0-g9b4fae77178e827ab17118fbc89c739ffd6a0fab
