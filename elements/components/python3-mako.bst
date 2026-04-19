kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

runtime-depends:
- components/python3.bst
- components/python3-markupsafe.bst

sources:
- kind: git_repo
  url: github:sqlalchemy/mako.git
  track: "rel_*"
  ref: rel_1_3_11-0-g217822b548fdf9fd730b2f3c1f1e770d4c816df9
  version-guess-pattern: '(\d+)_(\d+)_(\d+)'
