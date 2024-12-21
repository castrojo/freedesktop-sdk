kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:pallets/click.git
  track: 8.*
  ref: 8.1.8-0-g934813e4d421071a1b3db3973c02fe2721359a6e
