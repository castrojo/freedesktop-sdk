kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-appdirs.bst
- components/python3-distlib.bst
- components/python3-filelock.bst
- components/python3-pathlib2.bst

sources:
- kind: git_repo
  url: github:pypa/virtualenv.git
  track: '*.*.*'
  ref: 20.29.0-0-g0f6dc41fe3bb598dc485e045dcfe94dfc39e5f99
