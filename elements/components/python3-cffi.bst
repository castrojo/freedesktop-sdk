kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/pkg-config.bst

depends:
- components/libffi.bst
- components/python3.bst
- components/python3-pycparser.bst

sources:
- kind: git_repo
  url: github:python-cffi/cffi.git
  track: v*
  exclude:
  - "*rc*"
  - "*b*"
  ref: v1.17.1-0-g38bd6be6b94a65182f4bffb45c78e230e9290f51
