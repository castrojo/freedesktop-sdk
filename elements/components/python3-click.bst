kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:pallets/click.git
  track: 7.*
  ref: 7.1.2-0-g1784558ed7c75c65764d2a434bd9cbb206ca939d
