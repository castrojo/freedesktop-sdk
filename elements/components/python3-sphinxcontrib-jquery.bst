kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3-sphinx.bst

sources:
- kind: git_repo
  url: github:sphinx-contrib/jquery.git
  track: master
  ref: v4.1-0-gf45993d5657e2afb96e4a730b9033673af7ab0ef
