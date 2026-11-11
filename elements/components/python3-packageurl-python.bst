kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:package-url/packageurl-python.git
  track: "v*.*.*"
  ref: v0.17.6-0-g04b755ccc388d6a53bb5277d1f95de4baa727deb
