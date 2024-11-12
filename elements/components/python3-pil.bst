kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/gcc.bst
- components/stripper.bst

depends:
- components/python3-setuptools.bst
- components/jpeg.bst

(@): include/strip.yml

sources:
- kind: git_repo
  url: github:python-pillow/Pillow.git
  track: "*.*.*"
  ref: 11.0.0-0-g204aae6682fc936f5350b3fe70335776f81480a7
