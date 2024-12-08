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
  ref: rel_1_3_8-0-g2c757d5219704030d900c6b2f83dab0a47b6ef82
