kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-contextlib2.bst

sources:
- kind: git_repo
  url: github:keleshev/schema.git
  track: v*
  ref: v0.7.7-0-g9cabb8d060b630482c2b7a965f4cb9f8be8bc9b8
