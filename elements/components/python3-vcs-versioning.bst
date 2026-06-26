kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/_private/git-minimal.bst
- components/python3.bst
- components/python3-packaging.bst

variables:
  command-subdir: vcs-versioning

sources:
- kind: git_repo
  url: github:pypa/setuptools_scm.git
  track: vcs-versioning-v*
  ref: vcs-versioning-v2.2.0-0-ga70589150e28f43aded5852eed09765f69bfff66
