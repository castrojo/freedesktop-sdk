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
  ref: rel_1_3_5-0-ga54313f941c5e57b009df15d778f21baf43a73d6
