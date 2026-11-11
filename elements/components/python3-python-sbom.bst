kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst
- components/python3-hatch-fancy-pypi-readme.bst
- components/python3-installer.bst


depends:
- components/python3-packageurl-python.bst
- components/python3.bst
- components/python3-zipremove.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:tox-dev/python-sbom.git
  track: "*.*.*"
  ref: 0.3.1-0-g800cf535aec00992a891216cf7f1945167d62e89
