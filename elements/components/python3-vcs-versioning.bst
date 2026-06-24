kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/_private/git-minimal.bst
- components/python3.bst
- components/python3-packaging.bst

config:
  build-commands:
  - |
    cd vcs-versioning
    %{python} -mbuild %{build-args} .

  install-commands:
  - |
    cd vcs-versioning
    %{python} -minstaller %{dist-dir}/*.whl --destdir %{install-root}

sources:
- kind: git_repo
  url: github:pypa/setuptools_scm.git
  track: vcs-versioning-v*
  ref: vcs-versioning-v2.1.2-0-g0cde12385f2bc90c90287c8ca2e2e8f7e423fd45
