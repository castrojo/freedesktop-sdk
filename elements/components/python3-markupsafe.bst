kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/findutils.bst

depends:
- components/python3.bst

config:
  install-commands:
    (>):
    - find %{install-root} -name '*.c' -delete

sources:
- kind: git_repo
  url: github:pallets/markupsafe.git
  track: "*.*.*"
  exclude:
  - "*.*.x"
  ref: 3.0.4-0-gece26078ec168ebac69f02877238e68d4b376c91
