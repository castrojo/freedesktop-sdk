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
  ref: v0.4.0-0-g98b1e268a30be4b2d6efa5c69eae772edc442c7e
