kind: pyproject

(@):
- include/_private/python-setuptools-recc.yml

build-depends:
  (>):
  - components/python3-setuptools-scm.bst

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
  ref: 3.4.6-0-g5478b84058a2a04e2d67a5dabbe0a273706707aa
- kind: patch
  path: patches/python3-charset-normalizer/drop-setuptools-constraint.patch
