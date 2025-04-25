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
  ref: v8.3.1-0-gb6a20226f0d54442a3e5bd95eec0aefdc21e4a0d
