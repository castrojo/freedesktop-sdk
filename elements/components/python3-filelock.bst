kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:tox-dev/filelock.git
  track: "*.*.*"
  ref: 3.29.0-0-g469b47f192b0a9f8c8b795d9b9f57212c716959b
