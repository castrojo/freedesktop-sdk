kind: pyproject

(@):
- include/_private/python-setuptools-recc.yml

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:akornatskyy/wheezy.template.git
  track: '*.*.*'
  ref: 3.2.5-0-g23517899b7c5fbf6846b36b834bfbd8ffc32b16a
