kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst
- components/python3-semantic-version.bst
- components/python3-setuptools.bst
- components/python3-typing-extensions.bst

sources:
- kind: git_repo
  url: github:PyO3/setuptools-rust.git
  track: v*
  ref: v1.10.1-0-gdf30297ac3d06b3a6536c3d304e780cdccc86da1
