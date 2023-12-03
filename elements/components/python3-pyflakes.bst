kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:PyCQA/pyflakes.git
  track: '*.*.*'
  ref: '3.1.0-0-g58b94a021b2d966a40a5bced06bdd6188ddb9fc2'
