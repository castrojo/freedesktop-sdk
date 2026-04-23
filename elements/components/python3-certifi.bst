kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:certifi/python-certifi.git
  track: "*.*.*"
  ref: 2026.04.22-0-g5dddfb072243da27adde885b73ba9b809c3224ca
