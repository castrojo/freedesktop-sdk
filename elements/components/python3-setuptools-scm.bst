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
  ref: v8.1.0-0-g234b74fd9cf847baaac52a195d1ff4f59ed94c8c
