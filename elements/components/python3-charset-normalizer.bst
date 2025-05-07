kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:jawah/charset_normalizer.git
  track: "*.*.*"
  exclude:
  - "*rc*"
  - "*b*"
  ref: 3.4.2-0-g6422af1d50f1f46624deab585424e1ac4d08ba94
- kind: patch
  path: patches/python3-charset-normalizer/rm-mypy.patch
