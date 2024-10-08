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
  ref: 3.0.0-0-ga1c2147b17cbf0e57b7d7a6450ad4d9a5ff362cf
