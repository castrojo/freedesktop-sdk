kind: pip

build-depends:
- components/python3-installer.bst
- components/python3-pip.bst
- components/python3-setuptools-scm.bst
- components/python3-wheel.bst

depends:
- components/python3-sphinxcontrib-jquery.bst

sources:
- kind: git_tag
  url: github:readthedocs/sphinx_rtd_theme.git
  track: master
  ref: 2.0.0-0-g7c9b1b5d391f6d7fae72274393eb25d1df96e546
