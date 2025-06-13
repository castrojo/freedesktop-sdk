kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:mesonbuild/meson.git
  ref: 1.5.2-0-g187ef425f96b9ba091edce56e9491373c51b2a34
