kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:jd/tenacity.git
  track: '*.*.*'
  ref: 8.4.1-0-gee6a8f7a76654d712fd44604d3b6d4f9af6b2249
