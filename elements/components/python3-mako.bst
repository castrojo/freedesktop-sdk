kind: pyproject

(@):
- include/_private/python-setuptools-recc.yml

runtime-depends:
- components/python3.bst
- components/python3-markupsafe.bst

sources:
- kind: git_repo
  url: github:sqlalchemy/mako.git
  track: "rel_*"
  ref: rel_1_3_10-0-g6e514adcef6194bcf7fedc1b83078e110caaaadf
  version-guess-pattern: '(\d+)_(\d+)_(\d+)'
