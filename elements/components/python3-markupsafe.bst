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
  ref: 3.0.3-0-g297fc8e356e6836a62087949245d09a28e9f1b13
