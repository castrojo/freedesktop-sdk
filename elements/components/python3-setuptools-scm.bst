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
  ref: v8.0.3-0-g7e867ada4acbfc0e4f0448eb3c439bfd4e37fcc7
- kind: patch
  path: patches/python3-setuptools-scm/rich.patch
