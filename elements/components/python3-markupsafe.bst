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
  ref: 2.1.5-0-gfbba4acd0312826cec9cfe18371c7df07962cb65
