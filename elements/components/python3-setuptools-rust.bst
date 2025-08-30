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
  ref: v1.12.0-0-gd92876b377c50bf2df8844885b35ca04f336841b
