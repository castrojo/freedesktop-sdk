kind: pyproject

(@):
- include/_private/python-setuptools-recc.yml

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:pypa/distlib.git
  track: "*.*.*"
  ref: 0.4.0-0-gaff2cbbc4e8a87b9440cb93472789a213813dbd6
