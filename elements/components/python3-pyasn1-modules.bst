kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-pyasn1.bst

sources:
- kind: git_repo
  url: github:pyasn1/pyasn1-modules.git
  track: v*
  ref: v0.4.2-0-g7154ca47caea6e012ef58d6a9975c719f2b6213b
