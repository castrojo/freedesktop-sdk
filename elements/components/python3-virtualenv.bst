kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst
- components/python3-hatch-fancy-pypi-readme.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-appdirs.bst
- components/python3-distlib.bst
- components/python3-filelock.bst
- components/python3-pathlib2.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pypa/virtualenv.git
  track: '*.*.*'
  ref: 21.15.14-0-ge1f4e1bbe95990a965f9b1de2db9dd7a33efc42c
