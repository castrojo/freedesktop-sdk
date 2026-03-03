kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst
- components/stripper.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:chardet/chardet.git
  track: "*.*.*"
  exclude:
  - "*post*"
  ref: 7.0.0.rc4-0-gcc951583cf34e283b04e15942b1a053eb195c2cd
