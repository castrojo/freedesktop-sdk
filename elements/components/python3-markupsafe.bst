kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

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
  ref: 3.0.1-0-gef0b95e2544ea0d09230a57dc01ac91e3bab9689
