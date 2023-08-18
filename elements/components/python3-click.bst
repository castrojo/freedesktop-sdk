kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:pallets/click.git
  track: 8.*
  ref: 8.1.7-0-g874ca2bc1c30d93a4ac6e36a15ed685eafe89097
