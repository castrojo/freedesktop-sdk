kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:certifi/python-certifi.git
  track: "*.*.*"
  ref: 2025.01.31-0-g088f93122ea7c91cfdaeea7fa76ab2f850b8064d
