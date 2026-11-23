kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

environment:
  CHARSET_NORMALIZER_USE_MYPYC: 0

sources:
- kind: git_repo
  url: github:jawah/charset_normalizer.git
  track: "*.*.*"
  exclude:
  - "*rc*"
  - "*b*"
  ref: 3.5.3-0-g0b45fe26ec06006533c4b038fe239a01957e9d71
