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
  ref: 3.0.2-0-g28ace20b140d15c083e1cbc163ee6b7778ba098c
