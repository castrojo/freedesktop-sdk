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
  ref: 3.0.1-0-g7b894f5e7a5053dd35de406bc779020c229f20a9
