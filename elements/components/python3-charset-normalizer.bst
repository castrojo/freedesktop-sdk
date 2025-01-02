kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:jawah/charset_normalizer.git
  track: "*.*.*"
  exclude:
  - "*rc*"
  - "*b*"
  ref: 3.4.1-0-gffdf7f5f08beb0ceb92dc0637e97382ba27cecfa
