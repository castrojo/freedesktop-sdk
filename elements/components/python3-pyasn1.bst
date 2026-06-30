kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:pyasn1/pyasn1.git
  track: v*.*.*
  ref: v0.6.3-0-gaf65c3b92e9deeae50db4de390982dd970d87f98
