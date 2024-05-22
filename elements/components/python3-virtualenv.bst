kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst
- components/python3-hatch-vcs.bst

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
  ref: 20.26.2-0-g9b14661dc4fb6866533b556c470ee47263c7249f
