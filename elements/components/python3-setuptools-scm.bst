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
  ref: v9.0.3-0-g66e16e25102311618e46066d7a065f0c9269027e
