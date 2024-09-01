kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:certifi/python-certifi.git
  track: "*.*.*"
  ref: 2024.08.30-0-g325c2fde4f8eec10d682b09f3b0414dc05e69a81
