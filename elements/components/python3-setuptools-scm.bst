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
  track: v9.*
  exclude:
  - "*dev*"
  - "*vcs-*"
  ref: v9.2.2-0-ge56b78fcd4c1e79aa36c1e4700fca34c8ff540fe
