kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/_private/git-minimal.bst
- components/python3.bst
- components/python3-packaging.bst
- components/python3-setuptools.bst
- components/python3-vcs-versioning.bst

variables:
  command-subdir: setuptools-scm

sources:
- kind: git_repo
  url: github:pypa/setuptools_scm.git
  track: setuptools-scm-v*
  exclude:
  - "*dev*"
  - "*vcs-*"
  ref: setuptools-scm-v10.0.5-0-ge2ba34f52b5d375d680c069bc3fa89c4056a9347
