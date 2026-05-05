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
  ref: dulwich-1.2.1-0-g57806b8a4d041cd18bf84ba8d715f4dd0bc5e200
