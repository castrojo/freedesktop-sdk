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
  ref: vcs-versioning-v1.1.1-0-g81fef309b77b6db86203f4476383cd930942a9f0
