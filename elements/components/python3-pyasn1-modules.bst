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
  ref: v0.4.1-0-g36b036311a83c78175e92161f23afc5e9e56a6da
