kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst
- components/python3-hatch-vcs.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: filelock
  ref:
    sha256sum: e1199bf5194a2277273dacd50269f0d87d0682088a3c561c15674ea9005d8635
    suffix: 
      7d/98/6e68cf474669042ba6ba0a7761b8be04beb8131b366d5c6b1596f8cdfec2/filelock-3.15.3.tar.gz
