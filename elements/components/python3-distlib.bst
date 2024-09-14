kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:pypa/distlib.git
  track: "*.*.*"
  ref: 0.3.8-0-gab5f8e797fbc56a0e3488bba68d05e7a602cb63f
