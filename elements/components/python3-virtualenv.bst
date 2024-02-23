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
  ref: 20.25.1-0-gb49b35d1bd740af80d9c3a0a187402b93d2f7031
