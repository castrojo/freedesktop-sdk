kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3-sphinxcontrib-jquery.bst

sources:
- kind: git_repo
  url: github:readthedocs/sphinx_rtd_theme.git
  track: '*.*.*'
  exclude:
  - '*rc*'
  ref: 3.0.2-0-g5f03347239fd22a241a5b609ddb2f964c8b429aa
