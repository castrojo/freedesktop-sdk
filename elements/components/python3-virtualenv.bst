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
  ref: 21.2.0-0-g0b6f4445da2560cb11c4808ead464d94ffdf1b05
