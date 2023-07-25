kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:pallets/click.git
  track: 8.*
  ref: 8.1.6-0-g3793f5b2d79d5999552b970bf17c37588efcf008
