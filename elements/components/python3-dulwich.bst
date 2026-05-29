kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst
- components/python3-setuptools-rust.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-certifi.bst
- components/python3-urllib3.bst

sources:
- kind: git_repo
  url: github:jelmer/dulwich.git
  track: dulwich-*.*.*
  ref: dulwich-1.2.5-0-g073f4dfa9840af2da59887ed828b026b609faa6c
