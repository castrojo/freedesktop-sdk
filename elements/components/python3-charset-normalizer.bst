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
  ref: 3.4.3-0-g46f662da20edeced520c8819965a37eefbbc85de
- kind: patch
  path: patches/python3-charset-normalizer/rm-mypy.patch
