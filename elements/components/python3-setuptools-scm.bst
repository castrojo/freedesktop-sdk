kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst
- components/python3-setuptools.bst
- components/git-minimal.bst
- components/python3-typing-extensions.bst
- components/python3-packaging.bst

sources:
- kind: git_repo
  url: github:pypa/setuptools_scm.git
  track: v*
  ref: v8.0.4-0-g48b1cb547a407b986f674740eae4f54503a141e3
