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
  ref: v1.10.2-0-g5580ae82f72f410a89b812b3694569b70f497bea
